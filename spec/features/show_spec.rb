require 'spec_helper'

feature 'Visitor browsing the page that hosts the question' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @new_question =  Question.create(title: "This is the title of a question #{Time.now}", body: "Body of the question", user_id: @user.id)
    visit root_path
    click_link "#{@new_question.title}"
  end

  context 'on questions#show page' do

    it 'has a link to log in' do
      click_link "Log In"
      expect(current_path).to eq(login_path)
    end

    it 'has a link to sign up' do
      click_link "Sign Up"
      expect(current_path).to eq(register_path)
    end

    it 'displays the title of the question' do
      expect(page).to have_content(@new_question.title)
    end

    it 'displays the author of the question' do
      page.has_css?('.question-author')
    end
  end

  context 'on questions#show page' do
    let(:log_me_in) {
      visit login_path
      click_link "Log In"
      within("#new_user") do
        fill_in "Username", :with => @user.username
        fill_in "Password", :with => @user.password
        click_button "Log In"
      end
    }

    it 'allows a user to see comment box' do
      log_me_in
      visit root_path
      click_link "#{@new_question.title}"
      page.has_css? ('#comment_note')
    end

    it 'allows a user to see form to add an answer' do
      log_me_in
      visit root_path
      click_link "#{@new_question.title}"
      expect(page).to have_content("Add an Answer")
    end

  end
end
