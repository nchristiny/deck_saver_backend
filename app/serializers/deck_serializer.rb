class DeckSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id

  has_one :user, serializer: UserSerializer
end
