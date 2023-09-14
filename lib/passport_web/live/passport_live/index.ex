defmodule PassportWeb.PassportLive.Index do
  use PassportWeb, :live_view

  def mount(params, session, socket) do
    {:ok,
     socket
     |> assign(:uploaded_files, [])
     |> allow_upload(:passport, accept: ~w(.jpg .jpeg .png), max_entries: 1)}
  end

  def handle_event("validate", unsigned_params, socket) do
    IO.inspect(binding())
    {:noreply, socket}
  end

  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :passport, ref)}
  end

  def handle_event("save", _params, socket) do
    uploaded_files =
      consume_uploaded_entries(socket, :passport, fn %{path: path},
                                                     %Phoenix.LiveView.UploadEntry{
                                                       client_name: client_name
                                                     } ->
        dest = Path.join([:code.priv_dir(:passport), "static", "uploads", client_name])
        # The `static/uploads` directory must exist for `File.cp!/2`
        # and MyAppWeb.static_paths/0 should contain uploads to work,.

        File.cp!(path, dest)
        {:ok, ~p"/uploads/#{dest}"}
      end)

    {:noreply, update(socket, :uploaded_files, &(&1 ++ uploaded_files))}
  end

  def error_to_string(:too_large), do: "Too large"
  def error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
  def error_to_string(:too_many_files), do: "You have selected too many files"
end
