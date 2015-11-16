require 'rails_helper'

RSpec.describe QuestionsController do
  let(:sample_question) { FactoryGirl.create(:question)}
  let(:sample_user) { FactoryGirl.create(:user) }

  it '#index' do
    get :index
    expect(assigns(:questions)).to eq(Question.all.order(updated_at: :desc).limit(10))
  end

  it '#show' do
    get :show, id:  sample_question.id
    expect(assigns(:question)).to be_a_kind_of(Question)
  end

  it '#new' do
    get :new
    expect(assigns(:question)).to be_a_kind_of(Question)
  end

  context '#creates' do
    it 'creates a question with valid params' do
      expect {
        stub_current_user(sample_user)
        post :create, question: FactoryGirl.attributes_for(:question)
      }.to change(Question, :count).by(1)
    end
    it 'does not create a question with invalid params' do
      expect {
        stub_current_user(sample_user)
        post :create, question: FactoryGirl.attributes_for(:comment)
      }.to_not change(Question, :count)
    end
    it 'creates tags for a new question with tags' do
      expect {
        stub_current_user(sample_user)
        post :create, {"question"=>{"title"=>"Good Question", "body"=>"Do you know what's up?", "tags"=>"tag1, tag2, tag3"}}
      }.to change(Tag, :count).by(3)
    end
  end

  it "#edit/:id" do
    get :edit, :id => sample_question.id, :question => sample_question
    expect(assigns(:question)).to eq(sample_question)
  end

  context "#update/:id" do
#    def let(name, &block)
#      # do stuff
#      # and then invoke the block
#      block.call(args....)
#    end
#
#    let(:new_attr) { FactoryGirl.attributes_for(:derp) }
#    
#    do
#      {title: 'new title', body: 'new body'}
#    end

    before(:each) do
      put :update, :id => sample_question.id, :question => new_attr
      sample_question.reload
    end

    it { expect(sample_question.title).to eql new_attr[:title] }
    it { expect(sample_question.body).to eql new_attr[:body] }
  end
end



#   it '#new' do
#     get :new
#     expect(assigns(:user)).to be_a_kind_of(User)
#   end

# let(:sample_user) { FactoryGirl.build(:user) }
