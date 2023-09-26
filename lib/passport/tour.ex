defmodule Passport.Tour do
  @moduledoc """
  The Tour context.
  """

  import Ecto.Query, warn: false
  alias Passport.Repo

  alias Passport.Tour.SpecialtyBar

  @doc """
  Returns the list of specialty_bars.

  ## Examples

      iex> list_specialty_bars()
      [%SpecialtyBar{}, ...]

  """
  def list_specialty_bars do
    Repo.all(SpecialtyBar)
  end

  @doc """
  Gets a single specialty_bar.

  Raises `Ecto.NoResultsError` if the Specialty bar does not exist.

  ## Examples

      iex> get_specialty_bar!(123)
      %SpecialtyBar{}

      iex> get_specialty_bar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_specialty_bar!(id), do: Repo.get!(SpecialtyBar, id)

  @doc """
  Creates a specialty_bar.

  ## Examples

      iex> create_specialty_bar(%{field: value})
      {:ok, %SpecialtyBar{}}

      iex> create_specialty_bar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_specialty_bar(attrs \\ %{}) do
    %SpecialtyBar{}
    |> SpecialtyBar.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a specialty_bar.

  ## Examples

      iex> update_specialty_bar(specialty_bar, %{field: new_value})
      {:ok, %SpecialtyBar{}}

      iex> update_specialty_bar(specialty_bar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_specialty_bar(%SpecialtyBar{} = specialty_bar, attrs) do
    specialty_bar
    |> SpecialtyBar.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a specialty_bar.

  ## Examples

      iex> delete_specialty_bar(specialty_bar)
      {:ok, %SpecialtyBar{}}

      iex> delete_specialty_bar(specialty_bar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_specialty_bar(%SpecialtyBar{} = specialty_bar) do
    Repo.delete(specialty_bar)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking specialty_bar changes.

  ## Examples

      iex> change_specialty_bar(specialty_bar)
      %Ecto.Changeset{data: %SpecialtyBar{}}

  """
  def change_specialty_bar(%SpecialtyBar{} = specialty_bar, attrs \\ %{}) do
    SpecialtyBar.changeset(specialty_bar, attrs)
  end

  alias Passport.Tour.Checkin

  @doc """
  Returns the list of checkins.

  ## Examples

      iex> list_checkins()
      [%Checkin{}, ...]

  """
  def list_checkins do
    Repo.all(Checkin)
  end

  @doc """
  Gets a single checkin.

  Raises `Ecto.NoResultsError` if the Checkin does not exist.

  ## Examples

      iex> get_checkin!(123)
      %Checkin{}

      iex> get_checkin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_checkin!(id), do: Repo.get!(Checkin, id)

  @doc """
  Creates a checkin.

  ## Examples

      iex> create_checkin(%{field: value})
      {:ok, %Checkin{}}

      iex> create_checkin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_checkin(attrs \\ %{}) do
    %Checkin{}
    |> Checkin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a checkin.

  ## Examples

      iex> update_checkin(checkin, %{field: new_value})
      {:ok, %Checkin{}}

      iex> update_checkin(checkin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_checkin(%Checkin{} = checkin, attrs) do
    checkin
    |> Checkin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a checkin.

  ## Examples

      iex> delete_checkin(checkin)
      {:ok, %Checkin{}}

      iex> delete_checkin(checkin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_checkin(%Checkin{} = checkin) do
    Repo.delete(checkin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking checkin changes.

  ## Examples

      iex> change_checkin(checkin)
      %Ecto.Changeset{data: %Checkin{}}

  """
  def change_checkin(%Checkin{} = checkin, attrs \\ %{}) do
    Checkin.changeset(checkin, attrs)
  end
end
