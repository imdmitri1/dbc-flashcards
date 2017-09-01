class User < ActiveRecord::Base
  has_many :decks
  has_many :cards

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
