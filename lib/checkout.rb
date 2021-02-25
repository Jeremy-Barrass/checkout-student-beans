class Checkout
  attr_reader :prices
  private :prices

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

        leftover = count % _min
        eligible_amount = count - leftover

        valid = max { |_max, eligible_amount|  }

        if valid >= min 
          total += price * valid
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

      # if item == :apple || item == :pear
      #   if (count >= 2)
      #     leftover = count % 2
      #     total += prices.fetch(item) * ((count - leftover) / 2)
      #     total += prices.fetch(item) * leftover
      #   else
      #     total += prices.fetch(item) * count
      #   end
      # elsif item == :banana || item == :pineapple
      #   if item == :pineapple
      #     total += (prices.fetch(item) / 2)
      #     total += (prices.fetch(item)) * (count - 1)
      #   else
      #     total += (prices.fetch(item) / 2) * count
      #   end
      # elsif item == :mango
      #   if count >= 3
      #    total += (prices.fetch(item)) * (count - 1)
      #   end
      # else
      #   total += prices.fetch(item) * count
      # end