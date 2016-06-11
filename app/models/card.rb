class Card < ApplicationRecord
  validates :cardId, uniqueness: true, presence: true

  has_many :users, through: :savedcards
  has_many :decks, through: :deckcards

  # disable STI
  self.inheritance_column = :_type_disabled
end
