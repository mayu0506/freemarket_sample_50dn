class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true
  # validates :first_name, presence: true
  validates :encrypted_password, presence: true
  

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,omniauth_providers: %i[facebook google_oauth2]
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
  has_many :likes
  has_one :payment
  
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
