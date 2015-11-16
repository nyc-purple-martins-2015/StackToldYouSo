class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :question_tags
  has_many :tags, :through => :question_tags

  validates :title, :body, :user_id, presence: true

  before_destroy do
    Answer.destroy_all(:question_id => self.id)
    Comment.destroy_all(:commentable_id => self.id, commentable_type: "Question")
    QuestionTag.destroy_all(:question_id => self.id)
  end
  def parse_tags(tagnames)
    # We have a vulnerability, basically if this thing doesn't have a key
    # called :tags, we blow up.  Could we pass this calculated array in as an
    # argument instead?
    #
    # When you use the destructive operations like map! you may be changing
    # something that someoen else counts on not being changed.  There is the
    # potential for some nasty side effects.  Prefer iteration into new
    # collections veruss descrutcive changing.
    tags = tagnames.map { |tag| Tag.find_or_create_by(description: tag.strip.downcase ) }
    tags = tags.uniq
    question.tags.clear unless question.tags.empty?
    tags.each do |tag|
      question.tags << tag
    end
  end

  def vote_count
    self.votes.sum(:value)
  end

  def self.search(search)
    if search
      where('title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%").includes(:comments, :tags, :answers).order(updated_at: :desc)
    else
      all.includes(:comments, :tags, :answers).order(updated_at: :desc)
    end
  end
end

