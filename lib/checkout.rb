class Checkout
  attr_reader :prices,:discounts
  private :prices
  private :discounts

  def initialize(prices, discounts)
    @prices = prices
    @discounts = discounts
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    total = 0

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      if discounts.key?(item)
        _min = discounts[item].threshold
        price = discounts[item].discount_price
        _max = discounts[item]._max

        leftover = _min > 0 ? count % _min : _min
        leftover += _max > 0 && count > _max ? count - _max : 0

        eligible_amount = count - leftover

        valid = _max > 0 && eligible_amount > _max ? _max : eligible_amount

        if valid >= _min 
          total += (price * valid).round(1)
        end

        total += prices.fetch(item) * leftover
      else
        total += prices.fetch(item) * count
      end
    end

    total
  end

  private

  def basket
    @basket ||= Array.new
  end
end