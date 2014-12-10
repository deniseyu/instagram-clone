module TestHelper
  
  def sign_up
    visit '/posts'
    click_link 'sign up'
    fill_in('Username', with: 'deniseyu')
    fill_in('Email', with: 'denise@test.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def submit_post
    visit '/posts'
    click_link 'submit post'
    fill_in('Caption', with: 'meow')
    click_button('Create Post')
  end

end