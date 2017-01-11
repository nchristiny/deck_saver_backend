class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, length: { maximum: 254 }, format: { with: VALID_EMAIL_REGEX }
  validates_presence_of :password, on: :create
  validates :api_key, uniqueness: true

  has_many :decks, dependent: :destroy
  has_many :cards, through: :saved_cards
  has_many :saved_cards, dependent: :destroy

  has_secure_password
  has_secure_token :api_key

  # Assign an API key on create
  before_create do |user|
    user.api_key = user.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end
end
