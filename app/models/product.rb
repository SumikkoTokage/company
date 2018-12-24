class Product < ApplicationRecord
	has_many :product_images, dependent: :destroy
	accepts_attachments_for :product_images, attachment: :image

	has_many :product_favorites, dependent: :destroy
	has_many :user, through: :product_favorites
	has_many :cart_items, dependent: :destroy
	belongs_to :creator
	enum category_id: { マグカップ:0, シール:1, シャツ:2 }
	enum postage_list_id: { 定形外郵便: 0, ゆうゆうメルカリ便: 1, らくらくメルカリ便: 2 }

	def product_favorited_by?(user)
        product_favorites.where(user_id: user.id).exists?
    end
end
