class Card < ApplicationRecord
  belongs_to :deck

  validates :cardId, uniqueness: true
end
