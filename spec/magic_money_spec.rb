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

  describe '#convert_to' do
    context 'with a valid currency' do
      let(:converted_money) { money.convert_to('USD') }
      let(:usd_money) { MagicMoney.new(20, 'USD') }

      it { expect(converted_money).to an_instance_of MagicMoney }
      it { expect(converted_money.currency).to eq 'USD' }
      it { expect(converted_money.amount).to eq 55.5 }
      it { expect(usd_money.convert_to('EUR').inspect).to eq '18.02 EUR' }
      it { expect(usd_money.convert_to('Bitcoin').inspect).to eq '0.08 Bitcoin' }
    end
  end
end
