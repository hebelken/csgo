FactoryGirl.define do
  factory :map do
    name { Faker::Name.first_name }
    url { Faker::Internet.url }
    tier{ Faker::Name.title }
  end
end
