class UserSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :name, :email, :created_at, :updated_at

  has_many :decks, serializer: DeckSerializer
end
