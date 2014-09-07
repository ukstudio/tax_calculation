require 'spec_helper'

describe TaxCalculation do
  context 'tax_inclusive = true' do
    let(:tax_calculation) { TaxCalculation.new(rate: 0.08, tax_inclusive: true)}

    before do
      tax_calculation.items << TaxCalculation::Item.new(price: 1080, quantity: 3)
      tax_calculation.items << TaxCalculation::Item.new(price: 20,   quantity: 1)
      tax_calculation.items << TaxCalculation::Item.new(price: 999,  quantity: 4)
    end

    subject { tax_calculation }

    it { expect(subject.total_price).to eq 7256 }
    it { expect(subject.tax).to eq 537 }
  end

  context 'tax_inclusive = false' do
    let(:tax_calculation) { TaxCalculation.new(rate: 0.08, tax_inclusive: false)}

    before do
      tax_calculation.items << TaxCalculation::Item.new(price: 1000, quantity: 3)
      tax_calculation.items << TaxCalculation::Item.new(price: 20,   quantity: 1)
      tax_calculation.items << TaxCalculation::Item.new(price: 999,  quantity: 4)
    end

    subject { tax_calculation }

    it { expect(subject.total_price).to eq 7577 }
    it { expect(subject.tax).to eq 561 }
  end
end
