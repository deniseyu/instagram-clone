require 'rails_helper'

  def sign_up
    visit '/posts'
    click_link 'Sign up'
    fill_in('Email', with: 'denise@test.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

describe 'user management' do 

  context 'when user is not logged in' do 

    it 'should see a link to sign in' do 
      visit '/posts'
      expect(page).to have_link('Sign in')
    end

    it 'should see a link to sign up' do
      visit '/posts'
      expect(page).to have_link('Sign up') 
    end

    it 'should see a link to sign in with Facebook' do 
      visit '/posts'
      expect(page).to have_link('Sign in with Facebook')
    end

    it 'should not see a link to sign out' do 
      visit '/posts'
      expect(page).not_to have_link('Sign out')
    end

  end

  context 'when user is logged in' do 

    it 'should be able to log out' do 
      sign_up
      click_link 'Sign out'
      expect(current_path).to eq('/')
    end

  end

end