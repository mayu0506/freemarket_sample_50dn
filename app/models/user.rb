class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, presence: true
  validates :birth_date, presence: true
  validates :encrypted_password, presence: true

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,omniauth_providers: %i[facebook google_oauth2]
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :prefecture
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product
  has_one :payment
  has_one :address
  has_many :products

  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end

  def self.find_or_create_by_omniauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.new(
        password: Devise.friendly_token[0, 20],
        nickname: auth.info.name,
        email:    auth.info.email,
        uid: auth.uid,
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        provider: auth.provider,
        )
    end
    return user
  end
end
