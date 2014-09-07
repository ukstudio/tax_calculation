require "tax_calculation/version"
require "bigdecimal"

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
    tmp = @items.inject(0) {|total, item|
      total += item.price * item.quantity
    }
    tax_inclusive? ? tmp : tmp * multiplier_rate
  end

  def multiplier_rate
    1 + rate
  end

  def tax_inclusive?
    @tax_inclusive
  end

  class Item
    attr_reader :price, :quantity
    def initialize(price:, quantity:)
      @price    = price
      @quantity = quantity
    end
  end
end
