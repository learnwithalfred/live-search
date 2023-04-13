FactoryBot.define do
  factory :search do
    query { 'Codeing is nice' }
    confirmed { false }
  end
end
