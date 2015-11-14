require 'rails_helper'

RSpec.describe QuestionsController do
  let(:sample_question) { FactoryGirl.create(:question)}
  let(:sample_user) { FactoryGirl.create(:user) }

  it '#index' do
    get :index
    expect(assigns(:questions)).to eq(Question.all.order(updated_at: :desc))
  end

  it '#show' do
    get :show, id:  sample_question.id
    expect(assigns(:question)).to be_a_kind_of(Question)
  end

  context '#creates' do
    it 'creates a question with valid params' do
      expect {
        stub_current_user(sample_user)
        post :create, question: FactoryGirl.attributes_for(:question)
      }.to change(Question, :count).by(1)
    end
  end
end



#   it '#new' do
#     get :new
#     expect(assigns(:user)).to be_a_kind_of(User)
#   end

# let(:sample_user) { FactoryGirl.build(:user) }
