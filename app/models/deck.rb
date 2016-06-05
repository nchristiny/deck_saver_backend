class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards

  validates :title, uniqueness: true
end
