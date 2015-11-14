require 'rails_helper'

RSpec.describe VotesController do

  context '#create votes for questions' do
    user = FactoryGirl.create(:user)
    let(:sample_question) { FactoryGirl.create(:question) }
    
    it 'user can upvote on a question' do
      expect{
        post :create,
        vote: {:value => 1, :user_id => user, :votable_type => "Question", :votable_id => sample_question.id}
      }.to change{sample_question.vote_count}.by(1)
    end

    it 'user can downvote on a question' do
      expect{
        post :create,
        vote: {:value => -1, :user_id => user, :votable_type => "Question", :votable_id => sample_question.id}
      }.to change{sample_question.vote_count}.by(-1)
    end
  end

  context '#create votes for answers' do
    user = FactoryGirl.create(:user)
    let(:sample_answer) { FactoryGirl.create(:answer)}

    it 'user can upvote on a answer' do
      expect{
        post :create,
        vote: {:value => 1, :user_id => user, :votable_type => "Answer", :votable_id => sample_answer.id}
      }.to change{sample_answer.vote_count}.by(1)
    end

    it 'user can downvote on a answer' do
      expect{
        post :create,
        vote: {:value => -1, :user_id => user, :votable_type => "Answer", :votable_id => sample_answer.id}
      }.to change{sample_answer.vote_count}.by(-1)
    end
  end

  context 'Visitors cannot #create a vote for questions ' do
    let(:sample_question) { FactoryGirl.create(:question) }
    
    it 'visitor can NOT upvote on a question' do
      expect{
        post :create,
        vote: {:value => 1, :user_id => nil, :votable_type => "Question", :votable_id => sample_question.id}
      }.to raise_error
    end

    it 'visitor can NOT down vote on a question' do
      expect{
        post :create,
        vote: {:value => -1, :user_id => nil, :votable_type => "Question", :votable_id => sample_question.id}
      }.to raise_error
    end
  end

  context 'Visitors cannot #create a vote for answers ' do
    let(:sample_answer) { FactoryGirl.create(:answer)}

    it 'user can NOT upvote on a answer' do
      expect{
        post :create,
        vote: {:value => 1, :user_id => nil, :votable_type => "Answer", :votable_id => sample_answer.id}
      }.to raise_error
    end

    it 'user can NOT downvote on a answer' do
      expect{
        post :create,
        vote: {:value => -1, :user_id => nil, :votable_type => "Answer", :votable_id => sample_answer.id}
      }.to raise_error
    end
  end

end
