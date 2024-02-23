Rails.application.routes.draw do
  root to: "lists#index"


  get "up" => "rails/health#show", as: :rails_health_check

  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
