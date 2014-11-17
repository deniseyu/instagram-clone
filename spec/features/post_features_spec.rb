require 'rails_helper'

describe 'post management' do 

  context 'when no posts have been submitted' do 

    it 'front page should contain no posts' do 
      visit '/posts'
      expect(page).to have_content('No posts have been submitted yet!')
    end

  end

  context 'when at least one post has been submitted' do 

    before do 
      Post.create(username: 'deniseyu', caption: 'I love cats')
    end

    it 'front page should contain posts' do 
      visit '/posts'
      expect(page).not_to have_content('No posts have been submitted yet!')
      expect(page).to have_content('deniseyu')
      expect(page).to have_content('I love cats')
    end

  end

end