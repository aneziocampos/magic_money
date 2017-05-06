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

  private
  def amount_as_money
    '%.2f' % @amount
  end
end
