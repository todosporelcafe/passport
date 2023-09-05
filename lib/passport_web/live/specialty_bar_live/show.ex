defmodule PassportWeb.SpecialtyBarLive.Show do
  use PassportWeb, :live_view

  alias Passport.Tour

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:specialty_bar, Tour.get_specialty_bar!(id))}
  end

  defp page_title(:show), do: "Show Specialty bar"
  defp page_title(:edit), do: "Edit Specialty bar"
end
