FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'password' }
  end
end