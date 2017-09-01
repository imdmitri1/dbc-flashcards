class CreateDeck < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :creator_id

      t.timestamps
    end
  end
end
