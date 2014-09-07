require 'spec_helper'

describe TaxCalculation do
  describe '#total_price' do
    let(:tax_calculation) { TaxCalculation.new(rate: 0.08, tax_inclusive: true)}
    before do
      tax_calculation.items << TaxCalculation::Item.new(price: 1080, quantity: 1)
    end

    subject { tax_calculation.total_price }

    it { is_expected.to eq 1080 }
  end
end
