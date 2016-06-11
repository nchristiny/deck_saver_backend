class Deck < ApplicationRecord
  validates :title, uniqueness: true, presence: true

  belongs_to :user
  has_many :cards, through: :deck_cards
end
