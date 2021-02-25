class Discounts
	attr_reader :discount_list
	public :discount_list

	def initialize
		@discount_list = {
			:apple => Item.new(2, 5, 0),
			:pear => Item.new(2, 7.5, 0),
			:banana => Item.new(0, 15, 0),
			:pineapple => Item.new(1, 50, 1),
			:mango => Item.new(3, 133.33, 0)
		}
	end
end

class Item
	attr_accessor :threshold,:discount_price,:_max

	:threshold
	:discount_price
	:_max

	def initialize(threshold, price, _max)
		@threshold = threshold
		@discount_price = price
		@_max = _max
	end

end