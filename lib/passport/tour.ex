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

  @bucket_name "passports.todosporelcafe.com"

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

  alias Passport.Tour.PhysicalDocument

  @doc """
  Returns the list of physical_documents.

  ## Examples

      iex> list_physical_documents()
      [%PhysicalDocument{}, ...]

  """
  def list_physical_documents do
    Repo.all(PhysicalDocument)
  end

  @doc """
  Gets a single physical_document.

  Raises `Ecto.NoResultsError` if the Physical document does not exist.

  ## Examples

      iex> get_physical_document!(123)
      %PhysicalDocument{}

      iex> get_physical_document!(456)
      ** (Ecto.NoResultsError)

  """
  def get_physical_document!(id), do: Repo.get!(PhysicalDocument, id)

  @doc """
  Creates a physical_document.

  ## Examples

      iex> create_physical_document(%{field: value})
      {:ok, %PhysicalDocument{}}

      iex> create_physical_document(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_physical_document(user, attrs \\ %{}) do
    user
    |> PhysicalDocument.physical_document_registration_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a physical_document.

  ## Examples

      iex> update_physical_document(physical_document, %{field: new_value})
      {:ok, %PhysicalDocument{}}

      iex> update_physical_document(physical_document, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_physical_document(%PhysicalDocument{} = physical_document, attrs) do
    physical_document
    |> PhysicalDocument.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a physical_document.

  ## Examples

      iex> delete_physical_document(physical_document)
      {:ok, %PhysicalDocument{}}

      iex> delete_physical_document(physical_document)
      {:error, %Ecto.Changeset{}}

  """
  def delete_physical_document(%PhysicalDocument{} = physical_document) do
    Repo.delete(physical_document)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking physical_document changes.

  ## Examples

      iex> change_physical_document(physical_document)
      %Ecto.Changeset{data: %PhysicalDocument{}}

  """
  def change_physical_document(%PhysicalDocument{} = physical_document, attrs \\ %{}) do
    PhysicalDocument.changeset(physical_document, attrs)
  end

  def upload_physical_document(path, filename) do
    file = to_string(Mix.env()) <> "\/" <> filename

    path
    |> ExAws.S3.Upload.stream_file()
    |> ExAws.S3.upload(@bucket_name, file)
    |> ExAws.request()
    |> case do
      {:ok, %{body: body, headers: _headers, status_code: 200}} ->
        {:ok, body}

      {:error, {error, _status_code, result}} ->
        {:error, error, result.body}
    end
  end
end
