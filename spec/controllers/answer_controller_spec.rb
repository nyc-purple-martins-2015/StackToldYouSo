require 'rails_helper'

RSpec.describe AnswersController do
  before(:each) do
    stub_authorize_user!
    user = FactoryGirl.create(:user)
    stub_current_user(user)
    @question = FactoryGirl.create(:question)
  end
  context '#create' do
    it 'creates a new answer with valid params' do
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
