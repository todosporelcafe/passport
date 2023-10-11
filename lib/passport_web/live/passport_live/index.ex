defmodule PassportWeb.PassportLive.Index do
  use PassportWeb, :live_view
  alias Passport.Tour
  alias Passport.Tour.PhysicalDocument
  alias Phoenix.LiveView.UploadEntry

  def mount(_params, _session, socket) do
    changeset = Tour.change_physical_document(%PhysicalDocument{})

    {:ok,
     socket
     |> assign(:upload_class, "")
     |> assign_form(changeset)
     |> allow_upload(:passport, accept: ~w(.jpg .jpeg .png), max_entries: 1)}
  end

  def handle_event("validate", %{"physical_document" => physical_document_params}, socket) do
    physical_document_changeset =
      %PhysicalDocument{}
      |> Tour.change_physical_document(physical_document_params)
      |> Map.put(:action, :validate)

    socket =
      socket.assigns.uploads.passport.entries
      |> Enum.empty?()
      |> case do
        true -> socket
        false -> assign(socket, :upload_class, "invisible")
      end
      |> assign_form(physical_document_changeset)

    {:noreply, socket}
  end

  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    socket =
      socket
      |> assign(:upload_class, "")

    {:noreply, cancel_upload(socket, :passport, ref)}
  end

  def handle_event("save", %{"physical_document" => physical_document_params}, socket) do
    consume_uploaded_entries(socket, :passport, fn %{path: path}, %UploadEntry{} = entry ->
      path
      |> Tour.upload_physical_document(entry.client_name)
      |> case do
        {:error, error, reason} -> {:postpone, %{error: error, reason: reason}}
        result -> result
      end
    end)
    |> List.first()
    |> case do
      nil ->
        physical_document_params
        |> Tour.create_physical_document()
        |> case do
          {:ok, _physical_document} ->
            socket =
              socket
              |> put_flash(:info, "Passport added")
              |> redirect(to: ~p"/my_profile")

            {:noreply, socket}

          {:error, %Ecto.Changeset{} = changeset} ->
            {:noreply, assign(socket, form: to_form(changeset))}
        end

      %{location: location} = _passport_photo ->
        physical_document_params
        |> Map.put("img_url", location)
        |> Tour.create_physical_document()
        |> case do
          {:ok, _physical_document} ->
            socket =
              socket
              |> put_flash(:info, "Passport added")
              |> redirect(to: ~p"/my_profile")

            {:noreply, socket}

          {:error, %Ecto.Changeset{} = changeset} ->
            {:noreply, assign(socket, form: to_form(changeset))}
        end

      %{error: _error, reason: _reason} ->
        changeset =
          %PhysicalDocument{}
          |> Tour.change_physical_document(physical_document_params)
          |> Map.put(:action, :validate)

        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  def error_to_string(:too_large), do: "Too large"
  def error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
  def error_to_string(:too_many_files), do: "You have selected too many files"

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end
end
