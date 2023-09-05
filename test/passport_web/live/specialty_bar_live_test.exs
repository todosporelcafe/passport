defmodule PassportWeb.SpecialtyBarLiveTest do
  use PassportWeb.ConnCase

  import Phoenix.LiveViewTest
  import Passport.TourFixtures

  @create_attrs %{name: "some name", address: "some address", description: "some description", instagram: "some instagram", tiktok: "some tiktok", facebook: "some facebook"}
  @update_attrs %{name: "some updated name", address: "some updated address", description: "some updated description", instagram: "some updated instagram", tiktok: "some updated tiktok", facebook: "some updated facebook"}
  @invalid_attrs %{name: nil, address: nil, description: nil, instagram: nil, tiktok: nil, facebook: nil}

  defp create_specialty_bar(_) do
    specialty_bar = specialty_bar_fixture()
    %{specialty_bar: specialty_bar}
  end

  describe "Index" do
    setup [:create_specialty_bar]

    test "lists all specialty_bars", %{conn: conn, specialty_bar: specialty_bar} do
      {:ok, _index_live, html} = live(conn, ~p"/specialty_bars")

      assert html =~ "Listing Specialty bars"
      assert html =~ specialty_bar.name
    end

    test "saves new specialty_bar", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/specialty_bars")

      assert index_live |> element("a", "New Specialty bar") |> render_click() =~
               "New Specialty bar"

      assert_patch(index_live, ~p"/specialty_bars/new")

      assert index_live
             |> form("#specialty_bar-form", specialty_bar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#specialty_bar-form", specialty_bar: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/specialty_bars")

      html = render(index_live)
      assert html =~ "Specialty bar created successfully"
      assert html =~ "some name"
    end

    test "updates specialty_bar in listing", %{conn: conn, specialty_bar: specialty_bar} do
      {:ok, index_live, _html} = live(conn, ~p"/specialty_bars")

      assert index_live |> element("#specialty_bars-#{specialty_bar.id} a", "Edit") |> render_click() =~
               "Edit Specialty bar"

      assert_patch(index_live, ~p"/specialty_bars/#{specialty_bar}/edit")

      assert index_live
             |> form("#specialty_bar-form", specialty_bar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#specialty_bar-form", specialty_bar: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/specialty_bars")

      html = render(index_live)
      assert html =~ "Specialty bar updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes specialty_bar in listing", %{conn: conn, specialty_bar: specialty_bar} do
      {:ok, index_live, _html} = live(conn, ~p"/specialty_bars")

      assert index_live |> element("#specialty_bars-#{specialty_bar.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#specialty_bars-#{specialty_bar.id}")
    end
  end

  describe "Show" do
    setup [:create_specialty_bar]

    test "displays specialty_bar", %{conn: conn, specialty_bar: specialty_bar} do
      {:ok, _show_live, html} = live(conn, ~p"/specialty_bars/#{specialty_bar}")

      assert html =~ "Show Specialty bar"
      assert html =~ specialty_bar.name
    end

    test "updates specialty_bar within modal", %{conn: conn, specialty_bar: specialty_bar} do
      {:ok, show_live, _html} = live(conn, ~p"/specialty_bars/#{specialty_bar}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Specialty bar"

      assert_patch(show_live, ~p"/specialty_bars/#{specialty_bar}/show/edit")

      assert show_live
             |> form("#specialty_bar-form", specialty_bar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#specialty_bar-form", specialty_bar: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/specialty_bars/#{specialty_bar}")

      html = render(show_live)
      assert html =~ "Specialty bar updated successfully"
      assert html =~ "some updated name"
    end
  end
end
