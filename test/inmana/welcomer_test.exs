defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, return a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, return a simple message" do
      params = %{"name" => "Rodrigo", "age" => "25"}
      expected_result = {:ok, "Welcome, rodrigo"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user age is under 18, return an error" do
      params = %{"name" => "Rodrigo", "age" => "17"}
      expected_result = {:error, "You shall not pass rodrigo"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
