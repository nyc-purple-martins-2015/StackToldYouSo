require 'rails_helper'

RSpec.describe AnswersController do
  context "when logged in" do
    before(:each) do
      stub_authorize_user!
    end
    it "derp derp" do
    end
  end
  context "when not logged in" do
    it "derp derp" do
    end
  end

  before(:each) do
    stub_authorize_user!
    # More typically you setup the variables you'll need in your tests in a let
    # block.
    user = FactoryGirl.create(:user)
    stub_current_user(user)
    @question = FactoryGirl.create(:question)
  end
  context '#create' do
    let(:test_user) { FactoryGirl.create(:user) }
    it 'creates a new answer with valid params' do
      session[:user_id] = test_user.id
      expect{
        post :create, answer: {content: "Test answer", question_id: @question.id}
      }.to change(Answer, :count).by(1)
    end
    it 'does not create a new question with invalid params' do
      expect{
        post :create, answer: {note: "Test answer", question_id: @question.id}
      }.to_not change(Answer, :count)
    end
  end
end
