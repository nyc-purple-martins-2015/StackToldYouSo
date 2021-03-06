require 'spec_helper'

feature 'Visitor browsing the index' do
  context 'on questions#index page' do

    before(:each) do
      visit root_path
    end

    it 'has a link to log in' do
      click_link "Log In"
      expect(current_path).to eq(login_path)
    end

    it 'has a link to sign up' do
      click_link "Sign Up"
      expect(current_path).to eq(register_path)
    end

    it 'sees a list of the 10 most recent questions' do
      # page.has_css?('div .recent-questions')
      page.has_css?('div .link_to_question_page_container')
    end

    it 'sees answers (if any) of questions' do
      page.has_css?('p .show-answer')
    end

    it 'sees who wrote the question' do
      page.has_css?('p .question-author')
    end

    it 'shows how many answers are given to a question' do
      page.has_css?('span .answer-count')
    end

    it 'sees how many votes a question has received' do
      page.has_css?('span .vote-count')
    end

    it 'sees how long ago the question was last updated' do
      page.has_css?('span .time-update')
    end

    it 'can visit a question show page by clicking the title' do
      sample_user = FactoryGirl.create(:user)
      sample_question = Question.new(title: "This is the title of a sample question", body: "Body of the sample question", user_id: sample_user.id)
      sample_question.save
      visit root_path
      click_link "#{sample_question.title}"
      expect(page).to have_content("#{sample_question.body}")
    end

  end
end
