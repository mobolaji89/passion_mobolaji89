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

  def self.authenticate(username_or_email, password)
    p "********************************************"
    p username_or_email
    if username_or_email.include?('@')
      @user = User.find_by(email: username_or_email)
      return @user if @user.password == password
    elsif !(username_or_email.include?('@'))
      @user = User.find_by(username: username_or_email)
      return @user if @user.password == password
    else
      false
    end
  end
end
