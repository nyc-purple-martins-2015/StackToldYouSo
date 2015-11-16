require 'rails_helper'

RSpec.describe Answer do

  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :question_id }
  it { is_expected.to validate_presence_of :user_id }

  context '#votecount' do
    it 'sums the votes for the answer' do
      # This can be shorter if you use the FactoryGirl helper methods
      # create_list(:vote, 3, :user => true, user_id => "my user")
      #
      # This is a nice test
      answer = FactoryGirl.create(:answer)
      user = FactoryGirl.create(:user)
      Vote.create!(:value => 1, :votable_type => "Answer", :votable_id => answer.id, :user_id => user.id)
      Vote.create!(:value => 1, :votable_type => "Answer", :votable_id => answer.id, :user_id => user.id)
      Vote.create!(:value => 1, :votable_type => "Answer", :votable_id => answer.id, :user_id => user.id)
      Vote.create!(:value => -1, :votable_type => "Answer", :votable_id => answer.id, :user_id => user.id)
      expect(answer.vote_count).to eq(2)
    end
  end

end
