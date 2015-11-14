require 'spec_helper'

feature 'Visitor browsing the page that hosts the question' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @new_question =  FactoryGirl.create(:question)
  end

  context 'on questions#show page' do

    it 'displays the title of the question' do
      @new_question
      visit root_path
      save_and_open_page
      click_link "#{@new_question.title}"
      expect(page).to have_content(@new_question.title)
    end

    it 'displays the author of the question' do
      @new_question
      visit root_path
      save_and_open_page
      click_link "#{@new_question.title}"
      page.has_css?('.question-author')
    end

    it 'displays a form to leave a comment on a question' do
      @new_question
      visit root_path
      save_and_open_page
      click_link "#{@new_question.title}"
      page.has_css?('.new-comment')
    end

    it 'allows a user to leave a comment' do
      @new_question
      visit root_path
      save_and_open_page
      click_link "#{@new_question.title}"
      page.fill_in 'Comment'
      click_link_or_button ""
    end

  end
end