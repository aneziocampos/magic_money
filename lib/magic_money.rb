require 'magic_money/operators'

class MagicMoney
  include Operators

  attr_accessor :amount, :currency

  RATES = { 'EUR' => { 'USD' => 1.11, 'Bitcoin' => 0.0047 },
            'USD' => { 'EUR' => 0.9009, 'Bitcoin' => 0.0042 },
            'Bitcoin' => { 'EUR' => 212.7659, 'USD' => 238.0952 } }

  def initialize(amount, currency)
    validate_currency(currency)
    @amount = amount
    @currency = currency
  end

  def inspect
    "#{ amount_as_money } #{ @currency }"
  end

  def convert_to(new_currency)
    validate_currency(new_currency)
    MagicMoney.new(amount_in(new_currency), new_currency)
  end

  private
  def amount_as_money
    '%.2f' % @amount
  end

  def amount_in(new_currency)
    new_currency == @currency ? @amount : (@amount.to_f * RATES[@currency][new_currency]).round(2)
  end

  def validate_currency(currency)
    raise ArgumentError, 'Invalid currency' if RATES[currency].nil?
  end
end
