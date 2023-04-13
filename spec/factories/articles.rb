FactoryBot.define do
  factory :article do
    title { Faker::Movie.title }
  end
end
