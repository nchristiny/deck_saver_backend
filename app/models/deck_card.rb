class DeckCard < ApplicationRecord
  validates :card_id, presence: true
  validates :deck_id, presence: true

  belongs_to :deck, inverse_of: :deck_cards
  belongs_to :card, inverse_of: :deck_cards
end
