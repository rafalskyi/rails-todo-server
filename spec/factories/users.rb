FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email "test@mail.ru"
    password '123321'
  end
end
