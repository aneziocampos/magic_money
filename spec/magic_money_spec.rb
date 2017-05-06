require 'magic_money'

describe MagicMoney do
  describe '.initialize' do
    it 'receive and set amount and currency as params' do
      expect(MagicMoney.new(50, 'EUR')).to an_instance_of MagicMoney
    end
  end
end
