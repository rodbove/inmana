defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  alias InmanaWeb.RestaurantsController

  describe "create/2" do
    test "when all parameters are valid, creates the restaurant", %{conn: conn} do
      params = %{name: "Restaurant Name", email: "restaurant@email.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created",
               "restaurant" => %{
                 "email" => "restaurant@email.com",
                 "id" => _id,
                 "name" => "Restaurant Name"
               }
             } = response
    end

    test "when there are invalid parameters, returns an error", %{conn: conn} do
      params = %{name: "", email: ""}

      expected_response = %{
        "message" => %{"name" => ["can't be blank"], "email" => ["can't be blank"]}
      }

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
