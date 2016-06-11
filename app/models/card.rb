class Card < ApplicationRecord
  has_many :users, through: :savedcards
  has_many :decks, through: :deckcards

  validates :cardId, uniqueness: true, presence: true

  # disable STI
  self.inheritance_column = :_type_disabled
end
