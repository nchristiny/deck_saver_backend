class Deck < ApplicationRecord
  validates :title, uniqueness: true, presence: true

  belongs_to :user
  has_many :cards, through: :deck_cards

  # REFACTOR THIS
  # # Deck.new.build_deck
  # def build_deck
  # # Filter Deckcards
  # # #find_by_sql
  #   Card.find(:all).each do |card|
  #     self.deck_cards << DeckCard.new(:card => card)
  #   end
  # end
end
