FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'secrete' }
    password_confirmation { 'secrete' }
    name { Faker::Name.name }
    image { Faker::Avatar.image }
  end
end
