FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "テストユーザー#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'password' }
  end
end