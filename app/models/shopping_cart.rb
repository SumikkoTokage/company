class ShoppingCart < ApplicationRecord
	belongs_to :user
	has_many :cart_items, dependent: :destroy
	has_many :address_lines

	def sum_total_price
		cart_items.to_a.sum { |cart_item| cart_item.total_price }
	end
end
