class Savedcard < ApplicationRecord
  validates :card_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :card
end
