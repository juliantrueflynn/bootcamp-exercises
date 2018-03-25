class User < ApplicationRecord
  require 'bcrypt'

  attr_reader :password

  validates :username, :password_digest, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  after_initialize :ensure_session_token

  has_many :links
  has_many :comments

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.generate_session_token
    self.save!
    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil 
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    password_hash = BCrypt::Password.new(self.password_digest)
    password_hash.is_password?(password)
  end

  private
  
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
