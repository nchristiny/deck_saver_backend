class Deck < ApplicationRecord
  validates :title, uniqueness: true, presence: true

  belongs_to :user
  has_many :cards, through: :deck_cards
  has_many :deck_cards

  ##############################################################################
  # User sends in params to create empty deck
  # User later requests to create deck_card objects for each card picked
  # This method will create deck_card, with attributes card_id and deck_id
  # TODO
  # Add custom validator to limit 2 identical deck_cards per deck
  ##############################################################################

  def add_card(card)
    self.deck_cards << DeckCard.create(deck_id: self.id, card_id: card.id)
    self.reload
    p "Added #{card.name} to deck: #{self.title}"
  end

  # # REFACTOR THIS
  # # Deck.new.build_deck
  # # Filter Deckcards with #find_by_sql if necessary or just for kicks
  # def build_deck
  #   cards = Card.all
  #   cards.each do |card|
  #     self.deck_cards << DeckCard.new(deck_id: self.id, card_id: card.id)
  #   end
  # end

end
