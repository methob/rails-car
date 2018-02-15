Rails.application.routes.draw do
  namespace :backoffice do
    resources :cars
  end
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  authenticated :user do
    root 'backoffice/cars#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get 'users/sign_in' => 'devise/sessions#new'
    end
  end

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
