class User < ApplicationRecord
  include ActiveModel::Validations

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, uniqueness: true, presence: true, length: { maximum: 254 },
                      format: { with: VALID_EMAIL_REGEX }
end
