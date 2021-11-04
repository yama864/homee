Rails.application.routes.draw do
  root to:'home#top'
  get "/" => "home#top"
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
