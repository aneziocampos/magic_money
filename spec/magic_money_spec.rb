require 'magic_money'

describe MagicMoney do
  let(:money) { MagicMoney.new(50, 'EUR') }

  describe '.initialize' do
    it 'receive and set amount and currency as params' do
      expect(MagicMoney.new(50, 'EUR')).to an_instance_of MagicMoney
    end
  end

  describe '#amount' do
    it { expect(money.amount).to eq 50 }
  end

  describe '#currency' do
    it { expect(money.currency).to eq 'EUR' }
  end

  describe '#inspect' do
    it { expect(money.inspect).to eq '50.00 EUR' }
  end
end
