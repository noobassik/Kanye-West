require 'rails_helper'

RSpec.describe CurrencyConverter do
  describe '.convert' do
    context 'where euro is the base currency' do
      # stub_const("CurrencyRate::DEFAULT_CURRENCY", "EUR")

      before(:all) do
        eur = CurrencyRate.find_or_create_by!(abbrev: 'EUR', date: Date.today)
        eur.update!(rate: 1)

        usd = CurrencyRate.find_or_create_by!(abbrev: 'USD', date: Date.today)
        usd.update!(rate: 2)

        rub = CurrencyRate.find_or_create_by!(abbrev: 'RUB', date: Date.today)
        rub.update!(rate: 50)
      end

      it 'converts rubles to euros' do
        rubles_to_euros = CurrencyConverter.convert(value: 1, from: 'RUB', to: 'EUR')
        expect(rubles_to_euros).to eq(0.02)
      end

      it 'converts rubles to US dollars' do
        rubles_to_us_dollars = CurrencyConverter.convert(value: 1, from: 'RUB', to: 'USD')
        expect(rubles_to_us_dollars).to eq(0.04)
      end

      it 'converts euros to rubles' do
        euros_to_rubles = CurrencyConverter.convert(value: 1, from: 'EUR', to: 'RUB')
        expect(euros_to_rubles).to eq(50)
      end

      it 'converts euros to euros' do
        euros_to_euros = CurrencyConverter.convert(value: 1, from: 'EUR', to: 'EUR')
        expect(euros_to_euros).to eq(1)
      end

      it 'converts 0 rubles to euros' do
        rubles_to_euros = CurrencyConverter.convert(value: 0, from: 'RUB', to: 'EUR')
        expect(rubles_to_euros).to eq(0)
      end

      it 'converts negative amount of rubles to US dollars' do
        rubles_to_dollars_negative = CurrencyConverter.convert(value: -1, from: 'RUB', to: 'USD')
        rubles_to_dollars_positive = CurrencyConverter.convert(value: 1, from: 'RUB', to: 'USD')
        expect(rubles_to_dollars_negative).to eq(-1 * rubles_to_dollars_positive)
      end
    end
  end
end
