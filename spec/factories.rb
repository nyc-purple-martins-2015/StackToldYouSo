FactoryGirl.define do
  factory(:user) do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
  end

  factory(:question) do
    title { Faker::Book.title }
    body { Faker::Lorem.paragraph }
    user
  end

  factory(:answer) do
    content { Faker::Lorem.sentence }
    question
    user
  end

  factory(:comment) do
    note {Faker::Lorem.sentence}
    user

    factory(:question_comment) do
      association :commentable, factory: :question
    end

    factory(:answer_comment) do
      association :commentable, factory: :answer
    end

  end

  factory(:vote) do
    value {[-1, 1].sample}
    user

    factory(:question_vote) do
      association :votable, factory: :question
    end

    factory(:answer_vote) do
      association :votable, factory: :answer
    end
  end

  factory(:tag) do
    question
    description {Faker::Lorem.word}
  end
end

