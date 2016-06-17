class CardSerializer < ActiveModel::Serializer
  attributes :id, :cardId, :name, :cardSet, :type, :faction, :rarity, :cost, :attack, :health, :durability, :text, :inPlayText, :flavor, :artist, :collectible, :elite, :race, :playerClass, :howToGet, :howToGetGold, :img, :imgGold, :locale, :mechanics, :deck_id

end
