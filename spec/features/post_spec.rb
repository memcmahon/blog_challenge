require 'rails_helper'

describe "As a visitor" do
  describe "They visit the blog" do
    it "they can sign up as a user" do
      visit '/'

      click_on 'sign up'

      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'test'
      click_on 'submit'

      expect(current_path).to eq('/')
      expect(page).to have_content('New Post')
    end
  end
end

describe "As a user" do
  describe "They visit the blog" do
    it "they can log in" do
      visit '/'

      click on 'sign in'

      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'test'
      click_on 'submit'

      expect (current_path).to eq('/')
      expect(page).to have_content('Welcome test@example.com')
      expect(page).to have_content('New Post')
    end

    it "they can create a new post" do
      
    end
  end
end
