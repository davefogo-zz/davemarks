FactoryGirl.define do
  factory :bookmark do
    url Faker::Internet.url
    description Faker::Hipster.sentence
    topic
    user
  end
end
