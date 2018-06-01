require 'rails_helper'

describe 'As a user' do
  describe 'they visit the blog' do
    it 'they can leave a comment on a post' do
      user = User.create!(email: 'test@example.com', password: 'test', first_name: 'Megan', last_name: 'Test')
      post = user.posts.create(title: 'Test Title', body: 'Test post body')

      other_user = User.create!(email: 'othertest@example.com', password: 'test', first_name: 'Molly', last_name: 'Test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(other_user)

      visit '/'

      click_on 'Comment'

      fill_in 'comment_body', with: 'trolleys are great'
      click_on 'Create Comment'

      expect(current_path).to eq('/')
      expect(page).to have_content('trolleys are great')
      expect(page).to have_content('Comment')
    end
  end
end
