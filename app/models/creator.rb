class Creator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]
  validates_uniqueness_of :name
  validates_presence_of :name

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["name = :value", { :value => name }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end
  def email_changed?
    false
  end
  def will_save_change_to_email?
  false
  end


  has_many :bank_accounts, dependent: :destroy, inverse_of: :creator
  has_many :products, dependent: :destroy
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :bank_accounts, allow_destroy: true, reject_if: :all_blank
  attachment :image
  belongs_to :user



  # has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # # ====================自分がフォローされるユーザーとの関連 ===================================
  # #フォローされる側のCreatorから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  # # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  # has_many :followers, through: :passive_relationships, source: :following
  # # =======================================================================================

  # def followed_by?(current_user)
  #   # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
  #   active_relationships.find_by(follower_id: current_user.id).present?
  # end



  enum shop_status_id: {
      公開: 0,
      非公開: 1
  }

  enum send_date_id: {
      １: 0,
      ２: 1,
      ３: 2,
      ４: 3,
      ５: 4,
      ６: 5,
      ７: 6

  }

  enum delete_flag: {
    ユーザー: false,
    退会ユーザー: true
  }


end

class Creator::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :user_id, :telephone, :shop_name, :image, :description, :send_date_id, :password, :bank_accounts_attributes => [ :id, :bank_code, :bank_name, :branch_code_id, :deposit_type_id, :number, :name]])
  end
end
