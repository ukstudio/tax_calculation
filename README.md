# TaxCalculation

TaxCauculation is consumption tax calculation in ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'tax_calculation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tax_calculation

## Usage

```ruby
calculation = TaxCalculation.new(rate: 0.08, tax_inclusive: true)
calculation.items << TaxCalculation::Item.new(price: 1080, quantity: 1)
calculation.items << TaxCalculation::Item.new(price: 540,  quantity: 2)
calculation.total_price #=> 2160
calculation.tax         #=> 160
```

Calculation unit price and tax(I'm looking for a better way...)

```ruby
calculation = taxCalculation.new(rate: 0.08, tax_inclusive: false)
calculation.items << TaxCalculation::Item.new(price: 1000, quantity: 1)
calculation.total_price #=> 1080
calculation.tax         #=> 80
```



## Contributing

1. Fork it ( http://github.com/<my-github-username>/tax_calculation/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
