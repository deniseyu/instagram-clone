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
      Post.create(caption: 'I love cats')
    end

    it 'front page should contain posts' do 
      visit '/'
      expect(page).not_to have_content('No posts have been submitted yet!')
      expect(page).to have_content('I love cats')
    end

  end

  context 'creating posts on the front end' do 

    before do 
      visit '/'
      sign_up
      @cats = Post.create(caption: 'meow')
    end

    it 'a user can submit a new post' do 
      click_link 'Submit post'
      fill_in 'Caption', with: 'Cats are great'
      click_button('Create Post')
      expect(current_path).to eq posts_path
      expect(page).to have_content 'Cats are great'
    end

    it 'a user can view a post' do 
      visit '/'
      click_link 'view'
      expect(current_path).to eq "/posts/#{@cats.id}"
      expect(page).to have_content 'meow'
    end

  end

end