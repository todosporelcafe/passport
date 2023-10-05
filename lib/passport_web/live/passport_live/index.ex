defmodule PassportWeb.PassportLive.Index do
  use PassportWeb, :live_view
  alias Passport.Tour
  alias Passport.Tour.PhysicalDocument

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

  def handle_event("save", _params, socket) do
    _uploaded_files =
      consume_uploaded_entries(socket, :passport, fn %{path: path},
                                                     %Phoenix.LiveView.UploadEntry{
                                                       client_name: client_name
                                                     } ->
        dest = Path.join([:code.priv_dir(:passport), "static", "uploads", client_name])
        # The `static/uploads` directory must exist for `File.cp!/2`
        # and MyAppWeb.static_paths/0 should contain uploads to work,.

        File.cp!(path, dest)
        {:ok, "/uploads/#{dest}"}
      end)

    {:noreply, socket}
  end

  def error_to_string(:too_large), do: "Too large"
  def error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
  def error_to_string(:too_many_files), do: "You have selected too many files"

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end
end
