equire 'rails_helper'

RSpec.describe VotesController do

  before(:each) do
    user = stub_authorize_user!
  let(:sample_question) { FactoryGirl.create(:question) } 
  end

  context '#create' do

    it 'user can upvote on a question' do
      expect{
        post :create,
        vote: {:value => 1, :user_id => user.id, :votable_type => "Question", :votable_id => sample_question.id}
      }.to change(sample_question.vote_count, :count).by(1)
    end

    it 'user can downvote on a question' do
      expect{
        post :create,
        vote: {:value => -1, :user_id => user.id, :votable_type => "Question", :votable_id => sample_question.id}
      }.to change(sample_question.vote_count, :count).by(-1)
    end

  end
end
