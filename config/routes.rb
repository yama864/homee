Rails.application.routes.draw do
  get 'events/index'
  root to:'home#top'
  get "/" => "home#top"
  get "/groups/signin" => "groups#signin"
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  resources :groups, only: [:new, :create, :show] do
    resources :comments, only: [:index, :create]
    resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :groups do
    collection do
       get 'signin'
       post 'signinmove'
    end
  end
end
