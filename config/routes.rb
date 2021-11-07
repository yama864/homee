Rails.application.routes.draw do
  root to:'home#top'
  get "/" => "home#top"
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  resources :groups, only: [:new, :create, :show]
end
