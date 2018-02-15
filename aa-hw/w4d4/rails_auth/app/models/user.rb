class User < ApplicationRecord
  require 'bcrypt'

  attr_reader :password

  before_validation :ensure_session_token

  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: 'You must fill in a password' }
  validates :password, length: { minimum: 6, allow_nil: true }

  def self.generate_session_token!
    SecureRandom::urlsafe_base64(16)
  end

  def self.reset_session_token!
    self.session_token = self.class.generate_session_token!
    self.save!
    self.session_token
  end

  def self.find_by_credentials(user_name, password)
    user = self.find_by(username: user.username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    password_hash = BCrypt::Password.create(password)
    password_hash.is_password?(password)
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token!
  end
end
