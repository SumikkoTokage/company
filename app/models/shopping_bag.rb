class ShoppingBag < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	belongs_to :user, optional: true
	belongs_to :address_line, optional: true
	has_many :bag_items

	def sum_total_price
		bag_items.to_a.sum { |bag_item| bag_item.total_price }
	end
end
