class Card < ApplicationRecord
  validates :cardId, uniqueness: true, presence: true

  has_many :users, through: :saved_cards
  has_many :decks, through: :deck_cards
  has_many :deck_cards
  has_many :saved_cards

  # disable STI
  self.inheritance_column = :_type_disabled
end
