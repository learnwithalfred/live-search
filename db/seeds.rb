
User.create!(
  email: "test@example.com",
  password: "secrete",
  password_confirmation: "secrete",
  name: Faker::Name.name,
  image: Faker::Avatar.image
)

User.create!(
  email: "lydia@example.com",
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

10.times do
  Article.create!(
    title: Faker::Quote.matz,
    user: User.all.sample,
  )
end
