class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer :deck_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
