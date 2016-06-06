class DeckSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id
end
