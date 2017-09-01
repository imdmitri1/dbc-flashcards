class User < ActiveRecord::Base
  has_many :decks
  has_many :rounds

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hashed_pw)
  end

  def password=(new_password)
    self.hashed_pw = BCrypt::Password.create(new_password)
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
    return nil unless @user
    @user.password == password ? @user : nil
  end

end
