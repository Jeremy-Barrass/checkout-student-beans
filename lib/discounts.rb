class Discounts
	attr_reader :discount_list
	public :discount_list

	def initialize
		@discount_list = {
			:apple => {
				threshold: 2,
				discount_price: 5,
				_max: 0
			},
			:pear => {
				threshold: 2,
				discount_price: 7.5,
				_max: 0
			},
			:banana => {
				threshold: 0,
				discount_price: 15,
				_max: 0
			},
			:pineapple => {
				threshold: 1,
				discount_price: 50,
				_max: 1
			},
			:mango => {
				threshold: 3,
				discount_price: 133.33,
				_max: 0
			}
		}
	end
end