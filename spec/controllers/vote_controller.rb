equire 'rails_helper'

RSpec.describe VotesController do
  let(:sample_user) { FactoryGirl.build(:user) }

  context '#create' do

    it 'user can vote on a question' do
      expect{
        post :create
        user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by(1)
    end
  end
end
