class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :content, :question_id, :user_id, presence: true

  def vote_count
    self.votes.sum(:value)
  end
end
