class MagicMoney
  attr_accessor :amount, :currency

  RATES = { 'EUR' => { 'USD' => 1.11, 'Bitcoin' => 0.004 } }

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def inspect
    "#{ amount_as_money } #{ @currency }"
  end

  def convert_to(new_currency)
    MagicMoney.new(amount_in(new_currency), new_currency)
  end

  private
  def amount_as_money
    '%.2f' % @amount
  end

  def amount_in(new_currency)
    (@amount.to_f * RATES[@currency][new_currency]).round(2)
  end
end
