Rails.application.routes.draw do
  devise_for :users

  resources :teams do
    member do
      post :join_team
    end
  end
  resources :events, only: [:index, :show] do
    resources :tournaments, only: [:show] do
      resources :entries
      member do
        get :registration
      end
    end
  end

  root to: "events#index"
end
