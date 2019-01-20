defmodule Checkout do
  use GenServer
  alias Checkout.PricingRules
  require Logger

  #######
  # API #
  #######

  def new(), do: GenServer.start(__MODULE__, [], [])

  def new!() do
    case GenServer.start(__MODULE__, [], []) do
      {:ok, pid} -> pid
      error -> raise RuntimeError, message: "Error creating Checkout: #{inspect(error)}"
    end
  end

  def scan(pid, item), do: GenServer.cast(pid, {:add, item})

  def get_cart(pid), do: GenServer.call(pid, :get_cart)

  @spec get_items_count(atom() | pid() | {atom(), any()} | {:via, atom(), any()}) :: any()
  def get_items_count(pid), do: GenServer.call(pid, :get_items_count)

  def total(pid), do: GenServer.call(pid, :get_price)

  #############
  # Callbacks #
  #############

  def init(_args),
    do: {:ok, %{cart: [], price_module: Checkout.PricingRules}}

  def handle_cast({:add, item}, state = %{cart: cart}),
    do: {:noreply, %{state | cart: [item | cart]}}

  def handle_call(:get_cart, _from, state = %{cart: cart}),
    do: {:reply, cart, state}

  def handle_call(:get_items_count, _from, state = %{cart: cart}),
    do: {:reply, count_items(cart), state}

  def handle_call(:get_price, _from, %{cart: cart, price_module: price_module}) do
    items_count = cart |> count_items()
    total_price = apply(price_module, :calculate_price, [items_count])
    {:reply, total_price, cart}
  end

  ###########
  # Private #
  ###########

  defp count_items(cart) do
    acc = %{"GR1" => 0, "SR1" => 0, "CF1" => 0}

    Enum.reduce(cart, acc, fn item, acc ->
      case item do
        "GR1" ->
          %{acc | "GR1" => acc["GR1"] + 1}

        "SR1" ->
          %{acc | "SR1" => acc["SR1"] + 1}

        "CF1" ->
          %{acc | "CF1" => acc["CF1"] + 1}

        item ->
          Logger.warn("#{__MODULE__} Unavailable item: #{inspect(item)}")
          acc
      end
    end)
  end
end
