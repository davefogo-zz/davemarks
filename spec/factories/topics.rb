FactoryGirl.define do
  factory :topic do
    title Faker::Hacker.say_something_smart
    user
  end
end
