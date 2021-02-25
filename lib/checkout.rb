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
        _min = discounts[item].activation_threshold
        price = discounts[item].discount_price
        _max = discounts[item].maximum_available_on_discount

        leftover_item = _min > 0 ? count % _min : _min
        leftover_item += _max > 0 && count > _max ? count - _max : 0

        eligible_discount_item = count - leftover_item

        valid_discount_item = _max > 0 && eligible_discount_item > _max ? _max : eligible_discount_item

        if valid_discount_item >= _min 
          total += (price * valid_discount_item).round(1)
        end

        total += prices.fetch(item) * leftover_item
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