FactoryBot.define do
  factory :user_comment do
    user_id 1
    body "MyText"
    parent_id 1
  end
end
