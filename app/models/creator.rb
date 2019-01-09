class Creator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]
  validates :name,uniqueness: true
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
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  enum deposit_type_id: {
      普通預金: 0,
      当座預金: 1
    }

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

