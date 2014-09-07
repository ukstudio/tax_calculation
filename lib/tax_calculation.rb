require "tax_calculation/version"
require "bigdecimal"

require 'tax_calculation/item'
class TaxCalculation
  attr_reader :rate

  def initialize(rate: 0.08, tax_inclusive: true)
    @rate = BigDecimal(rate.to_s)
    @tax_inclusive = tax_inclusive
  end

  def items
    @items ||= []
    @items
  end

  def total_price
    round(total_price_without_round, 0)
  end

  def total_price_without_round
    tmp = @items.inject(0) {|total, item| total += item.price * item.quantity }
    tax_inclusive? ? BigDecimal(tmp.to_s) : tmp * multiplier_rate
  end

  def tax
    round(tax_without_round, 0)
  end

  def tax_without_round
    if tax_inclusive?
      total_price / multiplier_rate * rate
    else
      total_price - (@items.inject(0) {|total, item| total += item.price * item.quantity })
    end
  end

  def round(num, scale)
    BigDecimal(num.to_s).round(0, BigDecimal::ROUND_DOWN)
  end

  def multiplier_rate
    1 + rate
  end

  def tax_inclusive?
    @tax_inclusive
  end
end
