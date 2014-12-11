require 'rails_helper'

describe 'user management' do 

  context 'when user is not logged in' do 

    it 'should see a link to sign in' do 
      visit '/'
      expect(page).to have_link('sign in')
    end

    it 'should see a link to sign up' do
      visit '/'
      expect(page).to have_link('sign up') 
    end

    it 'should not see a link to sign out' do 
      visit '/'
      expect(page).not_to have_link('sign out')
    end

  end

  context 'when user is logged in' do 

    before do 
      sign_up
    end

    it 'should be able to log out' do 
      click_link 'sign out'
      expect(current_path).to eq('/')
    end

    it 'can submit a post' do 
      visit '/'
      click_link 'submit post'
      expect(current_path).to eq new_post_path
    end

    it 'can edit a post' do 
      visit '/'
      submit_post
      click_link '✎'
      fill_in 'Caption', with: 'purrrr'
      click_button 'Update Post'
      expect(current_path).to eq posts_path
      expect(page).to have_content('Post successfully edited')
    end

    it 'can delete a post' do 
      visit '/'
      submit_post
      click_link '☓'
      expect(current_path).to eq posts_path
      expect(page).to have_content 'Post successfully deleted'
    end

  end

end