class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.integer :card_id, null: false
      t.string :guess
      t.string :true_false, null:false

      t.timestamps
    end
  end
end
