require 'spec_helper'

feature 'Visitor browsing the page that hosts the question' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @new_question =  FactoryGirl.create(:question)
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

    it 'displays a form to leave a comment on a question' do
      save_and_open_page
      page.has_css?('.new-comment')
    end

    # it 'allows a user to leave a comment' do
    #   @new_question
    #   visit root_path
    #   save_and_open_page
    #   click_link "#{@new_question.title}"
    #   expect {
    #     fill_in 'note', with: "Commenting here!"
    #   }
    #   click_button "submit"
    #   expect(page).to have_content ("Commenting here!")
    # end

  end
end