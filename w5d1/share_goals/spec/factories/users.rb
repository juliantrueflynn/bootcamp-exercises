FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest BCrypt::Password.create("TestPassword")
    password "TestPassword"
    session_token { SecureRandom::urlsafe_base64(16) }
  end
end
