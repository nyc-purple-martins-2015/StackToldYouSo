class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :question_tags
  has_many :tags, :through => :question_tags

  validates :title, :body, :user_id, presence: true

  def vote_count
    self.votes.sum(:value)
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%").includes(:comments, :tags, :answers).order(updated_at: :desc)
    else
      all.includes(:comments, :tags, :answers).order(updated_at: :desc).limit(10)
    end
  end
end

