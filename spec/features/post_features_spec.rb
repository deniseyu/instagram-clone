require 'rails_helper'

describe 'post management' do 

  context 'when no posts have been submitted' do 

    it 'front page should contain no posts' do 
      visit '/'
      expect(page).to have_content('No posts have been submitted yet!')
    end

  end

  context 'when at least one post has been submitted' do 

    before do 
      @denise = User.create(username: 'deniseyu', email: 'denise@test.com', password: 'testtest', password_confirmation: 'testtest')
      Post.create(caption: 'I love cats', user: @denise)
    end

    it 'front page should contain posts' do 
      visit '/'
      expect(page).not_to have_content('No posts have been submitted yet!')
    end

    it 'anyone can like a post, which increases the likes count', js: true do 
      visit '/'
      expect(page).to have_content '♥︎ 0'
      find('.likes-link').trigger('click')
      expect(page).to have_content '♥︎ 1'
    end

  end

  context 'creating posts on the front end' do 

    before do 
      visit '/'
      sign_up
    end

    it 'a user can submit a new post' do 
      click_link 'submit post'
      fill_in 'Caption', with: 'Cats are great'
      click_button('Create Post')
      expect(current_path).to eq posts_path
      expect(page).to have_content 'deniseyu'
    end

    it 'a user can view a post' do 
      submit_post
      click_link '➭', match: :first
      expect(page).to have_content 'meow'
    end

  end


end