Rails.application.routes.draw do
  devise_for :users

  resources :teams do
    member do
      post :join_team
    end
  end
  resources :events, only: [:index, :show]

  root to: "events#index"
end
