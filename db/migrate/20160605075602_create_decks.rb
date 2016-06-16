class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :title, default: ""
      t.integer :user_id, index: true
      t.timestamps
    end
  end
end
