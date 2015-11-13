class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
  belongs_to :user

  validates :note, :commentable_type, :commentable_id, presence: true
end
