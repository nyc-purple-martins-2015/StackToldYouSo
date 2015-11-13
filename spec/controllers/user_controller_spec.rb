require 'rails_helper'

RSpec.describe UsersController do
  let(:sample_user) { FactoryGirl.build(:user) }

  it '#new' do
    get :new
    expect(assigns(:user)).to be_a_kind_of(User)
  end

  context '#create' do


    it 'creates a new user with valid params' do
      expect{
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it 'does not create create a user when params are invalid' do
      expect{
        post :create, user: FactoryGirl.attributes_for(:question)
      }.to_not change(User, :count)
    end
  end
end