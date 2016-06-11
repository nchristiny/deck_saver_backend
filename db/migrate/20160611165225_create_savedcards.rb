class CreateSavedcards < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_cards do |t|
      t.integer :user_id
      t.integer :card_id

      t.timestamps
    end
  end
end
