defmodule PassportWeb.SpecialtyBarLive.Index do
  use PassportWeb, :live_view

  alias Passport.Tour
  alias Passport.Tour.SpecialtyBar

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :specialty_bars, Tour.list_specialty_bars())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Specialty bar")
    |> assign(:specialty_bar, Tour.get_specialty_bar!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Specialty bar")
    |> assign(:specialty_bar, %SpecialtyBar{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Specialty bars")
    |> assign(:specialty_bar, nil)
  end

  @impl true
  def handle_info({PassportWeb.SpecialtyBarLive.FormComponent, {:saved, specialty_bar}}, socket) do
    {:noreply, stream_insert(socket, :specialty_bars, specialty_bar)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    specialty_bar = Tour.get_specialty_bar!(id)
    {:ok, _} = Tour.delete_specialty_bar(specialty_bar)

    {:noreply, stream_delete(socket, :specialty_bars, specialty_bar)}
  end
end
