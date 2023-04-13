20.times do
  Article.create!(
    title: Faker::Quote.matz
  )
end