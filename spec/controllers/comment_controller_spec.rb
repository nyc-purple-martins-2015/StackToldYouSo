require 'rails_helper'

RSpec.describe CommentsController do
  before(:each) do
    stub_authorize_user!
    @sample_user = FactoryGirl.create(:user)
  end
  context '#creates' do
    sample_answer = FactoryGirl.create(:answer)
    it 'creates a new comment for an answer with valid params' do
      expect{
        post :create, comment: {:note => "testnote", :user_id => @sample_user.id, :commentable_type => "Answer", :commentable_id => sample_answer.id}
      }.to change(Comment, :count).by(1)
    end
    it 'does not create a new comment for an answer with invalid params' do
      expect{
        post :create, comment: {:note => "testnote"}
      }.to_not change(Comment, :count)
    end
  end
end

