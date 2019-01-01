class Product < ApplicationRecord
	has_many :product_images, dependent: :destroy, inverse_of: :product
	accepts_nested_attributes_for :product_images
	has_many :product_favorites, dependent: :destroy
	has_many :user, through: :product_favorites
	has_many :cart_items, dependent: :destroy
	belongs_to :creator
	enum category_id: { 缶バッジ:0, マスキングテープ:1, マグカップ:2, トートバック:3, アクリルキーホルダー:4, ポストカード:5,
						Ｔシャツ:6, イヤリング:7, ピアス:8, ネックレス:9, ノート:10, クリアファイル:11, ペンケース:12, ボールペン:13 }
	enum postage_list_id: { 定形外郵便: 0, ゆうゆうメルカリ便: 1, らくらくメルカリ便: 2 }

	def product_favorited_by?(user)
        product_favorites.where(user_id: user.id).exists?
    end
    

end
