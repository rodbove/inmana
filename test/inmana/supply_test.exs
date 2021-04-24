defmodule InmanaSupplyTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Supply

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        restaurant_id: "a4ead8e8-0c2c-4286-ba7a-ac59d13e898f",
        description: "Picles com banana",
        expiration_date: "2021-04-24",
        responsible: "Lula Molusco"
      }

      response = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 description: "Picles com banana",
                 expiration_date: ~D[2021-04-24],
                 responsible: "Lula Molusco"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{
        restaurant_id: "",
        description: "Pi",
        expiration_date: "",
        responsible: "L"
      }

      expected_response = %{
        description: ["should be at least 3 character(s)"],
        expiration_date: ["can't be blank"],
        responsible: ["should be at least 2 character(s)"],
        restaurant_id: ["can't be blank"]
      }

      response = Supply.changeset(params)

      assert %Changeset{valid?: false} = response
      assert errors_on(response) == expected_response
    end
  end
end
