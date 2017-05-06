require 'magic_money'

describe MagicMoney do
  let(:money) { MagicMoney.new(50, 'EUR') }

  describe '.initialize' do
    context 'with valid currency' do
      it { expect(MagicMoney.new(50, 'EUR')).to an_instance_of MagicMoney }
    end

    context 'with invalid currency' do
      it { expect{ MagicMoney.new(50, 'YEN') }.to raise_error(ArgumentError, 'Invalid currency') }
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

    context 'with an invalid currency' do
      it { expect{ money.convert_to('YEN') }.to raise_error(ArgumentError, 'Invalid currency') }
    end
  end

  describe 'arithmetic operations' do
    let(:eur_money) { MagicMoney.new(50, 'EUR') }
    let(:usd_money) { MagicMoney.new(20, 'USD') }

    it { expect(eur_money + usd_money).to eq '68.02 EUR' }
    it { expect(eur_money - usd_money).to eq '31.98 EUR' }
    it { expect(eur_money / 2).to eq '25 EUR' }
    it { expect(usd_money * 3).to eq '60 USD' }
  end
end
