class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user

  belongs_to :deck
  has_many :cards, through: :deck

  has_many :guesses
  has_many :correct_cards, ->{ where("guesses.true_false" => "true" ) }, through: :guesses, source: :card

  has_many :cards_correct_on_first_attempt,
    ->{ where("guesses.attempt" => 1 ) },
    through: :guesses, source: :card


  def remaining_cards
    cards - correct_cards
  end

end
