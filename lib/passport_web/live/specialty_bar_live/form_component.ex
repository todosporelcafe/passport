defmodule PassportWeb.SpecialtyBarLive.FormComponent do
  use PassportWeb, :live_component

  alias Passport.Tour

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage specialty_bar records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="specialty_bar-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:address]} type="text" label="Address" />
        <.input field={@form[:instagram]} type="text" label="Instagram" />
        <.input field={@form[:tiktok]} type="text" label="Tiktok" />
        <.input field={@form[:facebook]} type="text" label="Facebook" />
        <.input field={@form[:description]} type="text" label="Description" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Specialty bar</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{specialty_bar: specialty_bar} = assigns, socket) do
    changeset = Tour.change_specialty_bar(specialty_bar)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"specialty_bar" => specialty_bar_params}, socket) do
    changeset =
      socket.assigns.specialty_bar
      |> Tour.change_specialty_bar(specialty_bar_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"specialty_bar" => specialty_bar_params}, socket) do
    save_specialty_bar(socket, socket.assigns.action, specialty_bar_params)
  end

  defp save_specialty_bar(socket, :edit, specialty_bar_params) do
    case Tour.update_specialty_bar(socket.assigns.specialty_bar, specialty_bar_params) do
      {:ok, specialty_bar} ->
        notify_parent({:saved, specialty_bar})

        {:noreply,
         socket
         |> put_flash(:info, "Specialty bar updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_specialty_bar(socket, :new, specialty_bar_params) do
    case Tour.create_specialty_bar(specialty_bar_params) do
      {:ok, specialty_bar} ->
        notify_parent({:saved, specialty_bar})

        {:noreply,
         socket
         |> put_flash(:info, "Specialty bar created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
