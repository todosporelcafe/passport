defmodule PassportWeb.PassportLive.Index do
  use PassportWeb, :live_view
  alias Passport.Tour
  alias Passport.Tour.PhysicalDocument
  alias Phoenix.LiveView.UploadEntry

  def mount(_params, _session, socket) do
    changeset = Tour.change_physical_document(%PhysicalDocument{})

    {:ok,
     socket
     |> assign_form(changeset)
     |> allow_upload(:passport, accept: ~w(.jpg .jpeg .png), max_entries: 1)}
  end

  def handle_event("validate", %{"physical_document" => physical_document_params}, socket) do
    physical_document_changeset =
      %PhysicalDocument{}
      |> Tour.change_physical_document(physical_document_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, physical_document_changeset)}
  end

  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
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
    |> IO.inspect()
    |> List.first()
    |> case do
      %{location: location} = _passport_photo ->
        changeset =
          %PhysicalDocument{}
          |> Tour.change_physical_document(Map.put(physical_document_params, "img_url", location))

        {:noreply, assign(socket, :form, to_form(changeset))}

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
