class DeckSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_one :user, serializer: UserSerializer
  has_many :cards, serializer: CardSerializer
end
