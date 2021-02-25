class Discounts
	attr_reader :discount_list
	public :discount_list

	def initialize
		@discount_list = {
			:apples => {
				threshold: 2,
				discount_price: 5,
				max: 0
			},
			:pears => {
				threshold: 2,
				discount_price: 7.5,
				max: 0
			},
			:bananas => {
				threshold: 0,
				discount_price: 15,
				max: 0
			},
			:pineapples => {
				threshold: 1,
				discount_price: 50,
				max: 1
			},
			:mangos => {
				threshold: 3,
				discount_price: 133.33,
				max: 0
			}
		}
end