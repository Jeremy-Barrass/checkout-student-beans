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

	Item = Struct.new(:activation_threshold,
		:discount_price,
		:maximum_available_on_discount)
end