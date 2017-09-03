class AddFirstTryColumnToGuess < ActiveRecord::Migration[5.1]
  def change
    add_column :guesses, :attempt, :integer
  end
end
