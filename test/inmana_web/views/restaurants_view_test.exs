defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase
  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Restaurant Name", email: "restaurant@email.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created",
               restaurant: %Restaurant{
                 email: "restaurant@email.com",
                 id: _id,
                 name: "Restaurant Name"
               }
             } = response
    end
  end
end
