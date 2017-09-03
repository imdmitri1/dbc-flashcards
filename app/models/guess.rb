class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :card

  def total
    self.sum(:attempt)
  end

end
