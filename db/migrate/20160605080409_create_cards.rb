class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :cardId
      t.string :name
      t.string :cardSet
      t.string :type
      t.string :faction
      t.string :rarity
      t.integer :cost
      t.integer :attack
      t.integer :health
      t.integer :durability
      t.string :text
      t.string :inPlayText
      t.string :flavor
      t.string :artist
      t.boolean :collectible
      t.boolean :elite
      t.string :race
      t.string :playerClass
      t.string :howToGet
      t.string :howToGetGold
      t.string :img
      t.string :imgGold
      t.string :locale
      t.text :mechanics, array: true, default: []
      t.timestamps
    end
  end
end
