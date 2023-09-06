defmodule PassportWeb.ProfileLive.Index do
  use PassportWeb, :live_view

  alias Passport.Accounts
  alias Passport.Accounts.Profile

  @impl true
  def mount(_params, _session, socket) do
    changeset = Accounts.change_profile(%Profile{})
    {:ok, assign(socket, :form, to_form(changeset))}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("validate", %{"profile" => profile_params}, socket) do
    profile_form =
      %Profile{}
      |> Accounts.change_profile(profile_params)
      |> Map.put(:action, :validate)
      |> to_form()

    {:noreply, assign(socket, :form, profile_form)}
  end

  @impl true
  def handle_event("save", %{"profile" => profile_params}, socket) do
    socket.assigns.current_user
    |> Accounts.create_profile(profile_params)
    |> case do
      {:ok, _profile} ->
        info = "We've update your profile"
        {:noreply, socket |> put_flash(:info, info) |> redirect(~p"/specialty_bars")}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end

    {:noreply, socket}
  end
end
