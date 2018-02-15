class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true
  validates :session_token, uniquness: true

  def self.find_by_credentials(user_name, password)
  end

  def reset_session_token!
  end

  def password=(password)
  end

  def is_password?(password)
  end
end