require 'spec_helper'

feature 'Visitor browsing the index' do
  context 'on questions#index page' do
    
    it 'has a link to log in' do
      visit root_path
      click_link "Log In"
      expect(current_path).to eq(login_path)
    end

    it 'has a link to sign up' do
      visit root_path
      click_link "Sign Up"
      expect(current_path).to eq(register_path)
    end

    it 'sees a list of the 10 most recent questions' do
      visit root_path
      page.has_css?('div .recent-questions')
    end

    it 'sees answers (if any) of questions' do
      visit root_path
      page.has_css?('p .show-answer')
    end

    it 'sees who wrote the question' do
      visit root_path
      page.has_css?('p .question-author')
    end

    it 'shows how many answers are given to a question' do
      visit root_path
      page.has_css?('span .answer-count')
    end

    it 'sees how many votes a question has received' do
      visit root_path
      page.has_css?('span .vote-count')
    end

    it 'sees how long ago the question was last updated' do
      visit root_path
      page.has_css?('span .time-update')
    end

    # it 'allows you to click on the title of the question to get to the question show page' do
    #   visit root_path
    #   first(:link, 'div .recent-questions').click
    #   expect(current_path)
    # end

  end
end