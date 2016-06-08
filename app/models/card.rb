class Card < ApplicationRecord
  belongs_to :deck

  validates :cardId, uniqueness: true, presence: true

  # disable STI
  self.inheritance_column = :_type_disabled
end
