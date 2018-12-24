class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: {
      男性: 0,
      女性: 1
  }

  enum delete_flag: {
    ユーザー: false,
    退会ユーザー: true
  }

  attachment :image
  has_many :address_lines, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :address_lines, allow_destroy: true, reject_if: :all_blank

  has_many :product_favorites, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :products, through: :product_favoritess
  has_one :shopping_cart
  has_many :shopping_bags
  has_one :creator

  # # ====================自分がフォローしているクリエイターとの関連 ===================================
  # #フォローする側のUserから見て、フォローされる側のCreatorを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  # has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  # has_many :followings, through: :active_relationships, source: :follower
  
  # # ========================================================================================

end

class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:id, :nickname, :email, :gender, :image, :password, address_lines_attributes: [:id, :name, :postcode, :prefecture_id, :city, :address]])
  end
end