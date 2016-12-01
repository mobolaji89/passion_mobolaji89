class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :reviews
  has_many :restaurants, through: :reviews

  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
    return @user if @user.password == password
  end
end
