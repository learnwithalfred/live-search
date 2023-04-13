20.times do
  Article.create!(
    title: Faker::Quote.matz
  )
end


User.create!(
  email: "test@example.com",
  password: "secrete",
  password_confirmation: "secrete",
  name: Faker::Name.name,
  image: Faker::Avatar.image
)


5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "secrete",
    password_confirmation: "secrete",
    name: Faker::Name.name,
    image: Faker::Avatar.image
  )
end
