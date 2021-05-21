FactoryBot.define do
  factory :brand do
    sequence(:name) { |n| "ブランド#{n}" }
  end
end