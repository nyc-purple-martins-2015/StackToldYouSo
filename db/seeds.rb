5.times do
  User.create!(
    username: Faker::Internet.user_name,
    password: "password"
    )  
end

20.times do
  Question.create!(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph,
    user_id: rand(1..5)
    )
end

25.times do
  Comment.create!(
    note: Faker::Lorem.sentence,
    commentable_type: ["Question", "Answer"].sample,
    commentable_id: rand(1..20)
    )
end

20.times do
  Answer.create!(
    content: Faker::Lorem.sentence,
    question_id: rand(1..20),
    user_id: rand(1..5)
    )
end

Question.first.tags.create!(
  description: Faker::Lorem.word
  )
