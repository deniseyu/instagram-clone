require 'rails_helper'

describe 'post management' do 

  context 'when user is not logged in' do 

    it 'should be able to login with Facebook' do 
      visit '/posts'
      expect(page).to have_content('Sign in with Facebook')
    end

  end


end