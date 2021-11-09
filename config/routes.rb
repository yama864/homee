Rails.application.routes.draw do
  root to:'home#top'
  get "/" => "home#top"
  get "/groups/signin" => "groups#signin"
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  resources :groups, only: [:new, :create, :show]

  resources :groups do
    collection do
       get 'signin'
       post 'signinmove'
    end
  end
end
