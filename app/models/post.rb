class Post < ApplicationRecord
	belongs_to :creator
	attachment :image
	has_many :post_favorites, dependent: :destroy

	validates :body, presence: true
    validates :image, presence: true

	def post_favorited_by?(user)
        post_favorites.where(user_id: user.id).exists?
    end


end
