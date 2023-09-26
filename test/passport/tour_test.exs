defmodule Passport.TourTest do
  use Passport.DataCase

  alias Passport.Tour

  describe "specialty_bars" do
    alias Passport.Tour.SpecialtyBar

    import Passport.TourFixtures

    @invalid_attrs %{name: nil, address: nil, description: nil, instagram: nil, tiktok: nil, facebook: nil}

    test "list_specialty_bars/0 returns all specialty_bars" do
      specialty_bar = specialty_bar_fixture()
      assert Tour.list_specialty_bars() == [specialty_bar]
    end

    test "get_specialty_bar!/1 returns the specialty_bar with given id" do
      specialty_bar = specialty_bar_fixture()
      assert Tour.get_specialty_bar!(specialty_bar.id) == specialty_bar
    end

    test "create_specialty_bar/1 with valid data creates a specialty_bar" do
      valid_attrs = %{name: "some name", address: "some address", description: "some description", instagram: "some instagram", tiktok: "some tiktok", facebook: "some facebook"}

      assert {:ok, %SpecialtyBar{} = specialty_bar} = Tour.create_specialty_bar(valid_attrs)
      assert specialty_bar.name == "some name"
      assert specialty_bar.address == "some address"
      assert specialty_bar.description == "some description"
      assert specialty_bar.instagram == "some instagram"
      assert specialty_bar.tiktok == "some tiktok"
      assert specialty_bar.facebook == "some facebook"
    end

    test "create_specialty_bar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tour.create_specialty_bar(@invalid_attrs)
    end

    test "update_specialty_bar/2 with valid data updates the specialty_bar" do
      specialty_bar = specialty_bar_fixture()
      update_attrs = %{name: "some updated name", address: "some updated address", description: "some updated description", instagram: "some updated instagram", tiktok: "some updated tiktok", facebook: "some updated facebook"}

      assert {:ok, %SpecialtyBar{} = specialty_bar} = Tour.update_specialty_bar(specialty_bar, update_attrs)
      assert specialty_bar.name == "some updated name"
      assert specialty_bar.address == "some updated address"
      assert specialty_bar.description == "some updated description"
      assert specialty_bar.instagram == "some updated instagram"
      assert specialty_bar.tiktok == "some updated tiktok"
      assert specialty_bar.facebook == "some updated facebook"
    end

    test "update_specialty_bar/2 with invalid data returns error changeset" do
      specialty_bar = specialty_bar_fixture()
      assert {:error, %Ecto.Changeset{}} = Tour.update_specialty_bar(specialty_bar, @invalid_attrs)
      assert specialty_bar == Tour.get_specialty_bar!(specialty_bar.id)
    end

    test "delete_specialty_bar/1 deletes the specialty_bar" do
      specialty_bar = specialty_bar_fixture()
      assert {:ok, %SpecialtyBar{}} = Tour.delete_specialty_bar(specialty_bar)
      assert_raise Ecto.NoResultsError, fn -> Tour.get_specialty_bar!(specialty_bar.id) end
    end

    test "change_specialty_bar/1 returns a specialty_bar changeset" do
      specialty_bar = specialty_bar_fixture()
      assert %Ecto.Changeset{} = Tour.change_specialty_bar(specialty_bar)
    end
  end

  describe "checkins" do
    alias Passport.Tour.Checkin

    import Passport.TourFixtures

    @invalid_attrs %{}

    test "list_checkins/0 returns all checkins" do
      checkin = checkin_fixture()
      assert Tour.list_checkins() == [checkin]
    end

    test "get_checkin!/1 returns the checkin with given id" do
      checkin = checkin_fixture()
      assert Tour.get_checkin!(checkin.id) == checkin
    end

    test "create_checkin/1 with valid data creates a checkin" do
      valid_attrs = %{}

      assert {:ok, %Checkin{} = checkin} = Tour.create_checkin(valid_attrs)
    end

    test "create_checkin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tour.create_checkin(@invalid_attrs)
    end

    test "update_checkin/2 with valid data updates the checkin" do
      checkin = checkin_fixture()
      update_attrs = %{}

      assert {:ok, %Checkin{} = checkin} = Tour.update_checkin(checkin, update_attrs)
    end

    test "update_checkin/2 with invalid data returns error changeset" do
      checkin = checkin_fixture()
      assert {:error, %Ecto.Changeset{}} = Tour.update_checkin(checkin, @invalid_attrs)
      assert checkin == Tour.get_checkin!(checkin.id)
    end

    test "delete_checkin/1 deletes the checkin" do
      checkin = checkin_fixture()
      assert {:ok, %Checkin{}} = Tour.delete_checkin(checkin)
      assert_raise Ecto.NoResultsError, fn -> Tour.get_checkin!(checkin.id) end
    end

    test "change_checkin/1 returns a checkin changeset" do
      checkin = checkin_fixture()
      assert %Ecto.Changeset{} = Tour.change_checkin(checkin)
    end
  end
end
