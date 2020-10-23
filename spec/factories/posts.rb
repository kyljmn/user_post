FactoryBot.define do
  factory :post do
    title { Faker::Book.title}
    text { Faker::Lorem.paragraph_by_chars }
    association :user, factory: :user, strategy: :build
  end
end
