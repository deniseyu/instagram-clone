Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  # devise_scope :user do 
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root to: 'posts#index'

shallow do 
  resources :posts do 
    resources :likes
  end
end

end
