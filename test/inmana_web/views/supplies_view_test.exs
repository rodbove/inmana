defmodule InmanaWeb.SuppliesViewTest do
  use InmanaWeb.ConnCase
  import Phoenix.View

  alias Inmana.Supply
  alias InmanaWeb.SuppliesView

  describe "render/2" do
    test "renders create.json" do
      restaurant_params = %{name: "Restaurant Name", email: "restaurant@email.com"}
      {:ok, restaurant} = Inmana.create_restaurant(restaurant_params)

      params = %{
        description: "Pão",
        expiration_date: "2021-04-30",
        responsible: "Sponge Bob",
        restaurant_id: restaurant.id
      }

      {:ok, supply} = Inmana.create_supply(params)

      response = render(SuppliesView, "create.json", supply: supply)

      assert %{
               message: "Supply created",
               supply: %Supply{
                 description: "Pão",
                 expiration_date: ~D[2021-04-30],
                 id: _id,
                 responsible: "Sponge Bob",
                 restaurant_id: restaurant_id
               }
             } = response
    end
  end
end
