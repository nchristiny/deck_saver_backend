class Deckcard < ApplicationRecord
  validates :card_id, presence: true
  validates :deck_id, presence: true

  belongs_to :deck
  belongs_to :card
end
