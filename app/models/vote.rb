class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :value, :user_id, :voteable_type, :votable_id, presence: true
end
