# Magic Money

Money conversion for different currencies.


## Getting Started

Add Magic Money to your Gemfile:

```ruby
gem "magic_money"
```

### Usage

Money conversions

```ruby
money = MagicMoney.new(100, 'USD')
money.convert_to('EUR')
# => 90.09 EUR
```

Use the objects for direct mathematic operations

```ruby
ten_dollars = MagicMoney.new(10, 'USD')
twenty_euros = MagicMoney.new(20, 'EUR')

ten_dollars + twenty_euros
# => "32.2 USD"

twenty_euros - ten_dollars
# => "10.99 EUR"

ten_dollars + 10
# => "20 USD"

twenty_euros * 3
# => "60 EUR"

twenty_euros / 2
# => "10 EUR"
```

You can also use it for comparisons

```ruby
ten_dollars = MagicMoney.new(10, 'USD')
twenty_euros = MagicMoney.new(20, 'EUR')

ten_dollars > twenty_euros
# false

twenty_euros > ten_dollars
# true

ten_dollars == MagicMoney.new(9.009, 'EUR')
# true

ten_dollars == MagicMoney.new(10, 'EUR')
# false
```

Pull requests are welcome, feel free to contribute!  :)
