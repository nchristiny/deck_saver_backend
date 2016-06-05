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
      t.string :text
      t.string :flavor
      t.string :artist
      t.boolean :collectible
      t.string :race
      t.string :howToGetGold
      t.string :img
      t.string :imgGold
      t.string :locale
      t.text :mechanics, array: true, default: []
      t.integer :deck_id, index: true
      t.timestamps
    end
  end
end