class AddColumnToRounds < ActiveRecord::Migration[5.1]
  def change
    add_column :rounds, :round_id, :integer
  end
end
