require 'magic_money'

describe MagicMoney do
  describe '.initialize' do
    it 'receive and set amount and currency as params' do
      expect(MagicMoney.new(50, 'EUR')).to an_instance_of MagicMoney
    end
  end

  describe '#amount' do
    it 'set and get amount value' do
      money = MagicMoney.new(50, 'EUR')
      expect(money.amount).to eq 50
    end
  end

  describe '#currency' do
    it 'set and get currency value' do
      money = MagicMoney.new(50, 'EUR')
      expect(money.currency).to eq 'EUR'
    end
  end

  describe '#inspect' do
    it 'override method to return human information for the object' do
      money = MagicMoney.new(50, 'EUR')
      expect(money.inspect).to eq '50.00 EUR'
    end
  end
end
