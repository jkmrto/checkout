defmodule Checkout.PriceHelper do

  @base_price_tea 3.11

  @base_price_strawberry 5.0
  @discount_price_strawberry 4.50

  @base_price_coffe 11.23
  @rate_discount_coffe 2/3

  def calculate_price(count_items) do
    teas_price(count_items["GR1"]) +
    strawberries_price(count_items["SR1"]) +
    coffes_price(count_items["CF1"])
  end

  def teas_price(n_teas),
    do: (div(n_teas, 2) + rem(n_teas, 2)) * @base_price_tea


  def strawberries_price(n_strawberries) do
    cond do
      n_strawberries >= 3 -> n_strawberries * @discount_price_strawberry
      true -> n_strawberries * @base_price_strawberry
    end
  end

  def coffes_price(n_coffes) do
    base_price =  n_coffes * @base_price_coffe
    cond do
      n_coffes >= 3 -> base_price * @rate_discount_coffe
      true -> base_price
    end
  end

end
