defmodule PassportWeb.PageControllerTest do
  use PassportWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Todos por el café"
  end
end
