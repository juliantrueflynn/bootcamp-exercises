FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { BCrypt::Password.create(Faker::Color.color_name * 3) }
    session_token { SecureRandom::urlsafe_base64(16) }
  end
end
