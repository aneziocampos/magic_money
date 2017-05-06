class MagicMoney
  attr_accessor :amount, :currency

  RATES = { 'EUR' => { 'USD' => 1.11, 'Bitcoin' => 0.004 } }

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end
end
