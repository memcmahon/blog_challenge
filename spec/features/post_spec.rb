require 'rails_helper'

describe "As a visitor" do
  describe "They visit the blog" do
    it "they can sign up as a user" do
      visit '/'

      click_on 'sign up'

      fill_in 'user_first_name', with: "Megan"
      fill_in 'user_last_name', with: "Test"
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'test'
      click_on 'Create User'

      expect(current_path).to eq('/')
      expect(page).to have_content('New Post')
    end
  end
end

describe "As a user" do
  describe "They visit the blog" do
    it "they can log in" do
      user = User.create!(email: 'test@example.com', password: 'test', first_name: 'Megan', last_name: 'Test')
      visit '/'

      click_on 'sign in'

      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'test'
      click_on 'Log In'

      expect(current_path).to eq('/')
      expect(page).to have_content('Welcome Megan')
      expect(page).to have_content('New Post')
    end

    it "they can log out" do
      user = User.create!(email: 'test@example.com', password: 'test', first_name: 'Megan', last_name: 'Test')
      visit '/'

      click_on 'sign in'

      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'test'
      click_on 'Log In'

      expect(current_path).to eq('/')

      click_on 'log out'
      expect(page).to_not have_content('Welcome Megan')
      expect(page).to_not have_content('New Post')
      expect(current_path).to eq('/')
    end

    it "they can create a new post" do

    end
  end
end
