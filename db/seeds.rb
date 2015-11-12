# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(username: "ders", password: "password")
user.questions.create(title: "Test?", body: "this is a test-body")
Question.first.answers.create(content: "this is your answer")
user2 = User.create(username: "Dom", password: "password")
Answer.first.update_attributes(user_id: 2)
Question.first.comments.create(note: "this is a question comment", user_id: 2)
Answer.first.comments.create(note: "this is an answer comment", user_id: 1)
Question.first.tags.create(description: "awesomesauce")
Comment.first.votes.create(value: 1, user_id: 1)
Question.first.votes.create(value: -1, user_id: 2)
