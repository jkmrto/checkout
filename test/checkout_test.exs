defmodule CheckoutTest do
  use ExUnit.Case
  alias Checkout

  @items1 ["GR1","SR1","GR1","GR1","CF1"]
  @price1 22.45
  @count_items1 %{"GR1" => 3, "SR1" => 1, "CF1" => 1}

  @items2 ["GR1", "GR1"]
  @price2 3.11
  @count_items2 %{"GR1" => 2, "SR1" => 0, "CF1" => 0}

  @items3 ["SR1","SR1","GR1", "SR1"]
  @price3 16.61
  @count_items3 %{"GR1" => 1, "SR1" => 3, "CF1" => 0}

  @items4 ["GR1", "CF1", "SR1", "CF1", "CF1"]
  @price4 30.57
  @count_items4 %{"GR1" => 1, "SR1" => 1, "CF1" => 3}

  test "Are items added to cart?" do
    {:ok, pid} = Checkout.new()
    @items1 |> Enum.each(&(Checkout.scan(pid, &1)))

    # Last item will be now on head, so we need to reverse original list
    assert Enum.reverse(@items1) == Checkout.get_cart(pid)
  end

  test "test count_items (@items1)" do
    pid = Checkout.new!()
    @items1 |> Enum.each(&(Checkout.scan(pid, &1)))
    assert @count_items1 == Checkout.get_items_count(pid)
  end

  test "test count_items (@items2)" do
    pid = Checkout.new!()
    @items2 |> Enum.each(&(Checkout.scan(pid, &1)))
    assert @count_items2 == Checkout.get_items_count(pid)
  end

  test "test count_items (@items3)" do
    pid = Checkout.new!()
    @items3 |> Enum.each(&(Checkout.scan(pid, &1)))
    assert @count_items3 == Checkout.get_items_count(pid)
  end

  test "test count_items (@item4)" do
    pid = Checkout.new!()
    @items4 |> Enum.each(&(Checkout.scan(pid, &1)))
    assert @count_items4 == Checkout.get_items_count(pid)
  end

  test "buy-one-get-one-free offers of GR1 (@items2)" do
    {:ok, pid} = Checkout.new()
    @items2 |> Enum.each(&(Checkout.scan(pid, &1)))
    assert @price2 == Checkout.total(pid)
  end

  test "test price (@items1)" do
    {:ok, pid} = Checkout.new()
    @items1 |> Enum.each(&(Checkout.scan(pid, &1)))
    assert @price1 == Checkout.total(pid)
  end

  test "test price (@items3)" do
    {:ok, pid} = Checkout.new()
    @items3 |> Enum.each(&(Checkout.scan(pid, &1)))
    assert @price3 == Checkout.total(pid)
  end

  test "test price (@item4)" do
    {:ok, pid} = Checkout.new()
    @items4 |> Enum.each(&(Checkout.scan(pid, &1)))
    assert @price4 == Checkout.total(pid)
  end
end




