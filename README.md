# Checkout

## Development Setup

Use  ```iex -S mix``` to run the project in interactive mode. There you can try this commands to check the behaviour of ```Checkout``` module:

```Elixir
# Example items 1
pid = Checkout.new!(Checkout.PricingRules) 
Checkout.scan(pid, "GR1")
Checkout.scan(pid, "SR1")
Checkout.scan(pid, "GR1")
Checkout.scan(pid, "GR1")
Checkout.scan(pid, "CF1")
Checkout.total(pid)
```

```Elixir
# Example items 2
pid = Checkout.new!(Checkout.PricingRules) 
Checkout.scan(pid, "GR1")
Checkout.scan(pid, "GR1")
Checkout.total(pid)
```
```Elixir
# Example items 3
pid = Checkout.new!(Checkout.PricingRules) 
Checkout.scan(pid, "SR1")
Checkout.scan(pid, "SR1")
Checkout.scan(pid, "GR1")
Checkout.scan(pid, "SR1")
Checkout.total(pid)
```

```Elixir
# Example items 4
pid = Checkout.new!(Checkout.PricingRules) 
Checkout.scan(pid, "GR1")
Checkout.scan(pid, "CF1")
Checkout.scan(pid, "SR1")
Checkout.scan(pid, "CF1")
Checkout.scan(pid, "CF1")
Checkout.total(pid)
```

## Elixir version control
This project uses [asdf](https://github.com/asdf-vm/asdf-elixir) to handle Elixir and Erlang version. Both version are stored at ```tool-versions```. 


## Test

To run the tests: 
```
mix test
```

