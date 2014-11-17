require 'rails_helper'

describe 'user management' do 

  context 'when user is not logged in' do 

    it 'should see a link to sign in' do 
      visit '/'
      expect(page).to have_link('Sign in')
    end

    it 'should see a link to sign up' do
      visit '/'
      expect(page).to have_link('Sign up') 
    end

    it 'should see a link to sign in with Facebook' do 
      visit '/'
      expect(page).to have_link('Sign in with Facebook')
    end

    it 'should not see a link to sign out' do 
      visit '/'
      expect(page).not_to have_link('Sign out')
    end

  end

  context 'when user is logged in' do 

    before do 
      sign_up
    end

    it 'should be able to log out' do 
      click_link 'Sign out'
      expect(current_path).to eq('/')
    end

    it 'can submit a post' do 
      visit '/'
      click_link 'Submit post'
      expect(current_path).to eq new_post_path
    end

    it 'can edit a post' do 
      visit '/'
      submit_post
      click_link 'edit'
      fill_in 'Caption', with: 'purrrr'
      click_button 'Update Post'
      expect(current_path).to eq posts_path
      expect(page).to have_content('Post successfully edited')
      expect(page).to have_content('purrrr')
    end

    it 'can delete a post' do 
      visit '/'
      submit_post
      click_link 'delete'
      expect(current_path).to eq posts_path
      expect(page).to have_content 'Post successfully deleted'
      expect(page).not_to have_content('meow')
    end

  end

end