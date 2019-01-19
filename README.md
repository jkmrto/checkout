# Checkout

## Development Setup

Use  ```iex -S mix``` to run the project in interactive mode. There you can try this commands to use it:
```
co = Checkout.new(pricing_rules)
co.scan(item)
co.scan(item)
price = co.total
```

### Elixir version control
This project uses ASDF to handle Elixir and Erlang version. Both version are stored at 'tool-versions'.


## Test

To run the tests: 
```
mix test
```