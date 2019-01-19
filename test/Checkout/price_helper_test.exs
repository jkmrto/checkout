defmodule Checkout.Test.PriceHelperTest do
  use ExUnit.Case
  alias Checkout.PriceHelper

  @base_price_tea 3.11

  @base_price_strawberry 5.0
  @discount_price_strawberry 4.50

  @base_price_coffe 11.23
  @rate_discount_coffe 2/3

  @price1 22.45
  @count_items1 %{"GR1" => 3, "SR1" => 1, "CF1" => 1}

  @price2 3.11
  @count_items2 %{"GR1" => 2, "SR1" => 0, "CF1" => 0}

  @price3 16.81
  @count_items3 %{"GR1" => 1, "SR1" => 3, "CF1" => 0}

  @price4 30.57
  @count_items4 %{"GR1" => 1, "SR1" => 1, "CF1" => 3}

  test "Teas Price" do
    assert @base_price_tea == PriceHelper.teas_price(2)
    assert 2*@base_price_tea == PriceHelper.teas_price(3)
    assert 2*@base_price_tea == PriceHelper.teas_price(4)
  end

  test "Strawberries Price" do
    assert 1*@base_price_strawberry == PriceHelper.strawberries_price(1)
    assert 2*@base_price_strawberry == PriceHelper.strawberries_price(2)
    assert 3*@discount_price_strawberry == PriceHelper.strawberries_price(3)
    assert 4*@discount_price_strawberry == PriceHelper.strawberries_price(4)
    assert 5*@discount_price_strawberry == PriceHelper.strawberries_price(5)
  end

  test "Coffes Price" do
    assert 1 * @base_price_coffe == PriceHelper.coffes_price(1)
    assert 2 * @base_price_coffe == PriceHelper.coffes_price(2)
    assert 3 * @base_price_coffe * @rate_discount_coffe ==
      PriceHelper.coffes_price(3)
    assert 4 * @base_price_coffe * @rate_discount_coffe==
      PriceHelper.coffes_price(4)
    assert 5 * @base_price_coffe * @rate_discount_coffe ==
      PriceHelper.coffes_price(5)
  end

  test "Price over items list (Test Data) " do
    @price1 == PriceHelper.calculate_price(@count_items1)
    @price2 == PriceHelper.calculate_price(@count_items2)
    @price3 == PriceHelper.calculate_price(@count_items3)
    @price4 == PriceHelper.calculate_price(@count_items4)
  end

end
