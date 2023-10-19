defmodule PassportWeb.ProfileLive.Index do
  use PassportWeb, :live_view

  alias Passport.Accounts
  alias Passport.Accounts.Profile

  @impl true
  def mount(_params, _session, socket) do
    user =
      socket.assigns.current_user.email
      |> Accounts.get_user_by_email()

    changeset =
      case user.profile do
        nil -> %Profile{}
        profile -> profile
      end
      |> Accounts.change_profile()

    {:ok, assign(socket, form: to_form(changeset), user: user)}
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
        info = "Your profile is updated"

        socket =
          socket |> put_flash(:info, info) |> push_navigate(to: "/specialty_bars")

        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
