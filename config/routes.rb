Rails.application.routes.draw do
  devise_for :users

  resources :teams
  resources :events, only: [:index, :show]

  root to: "events#index"
end
