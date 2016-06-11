class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, through: :deckcards

  validates :title, uniqueness: true, presence: true
end
