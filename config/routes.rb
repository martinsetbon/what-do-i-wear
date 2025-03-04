Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :outfits do
    resources :outfit_products, only: [:new, :create]
    collection do
      get 'new_from_products'  # Route to display the form for creating an outfit from products
      post 'create_from_products'  # Add a POST route for the create_from_products actio
    end
  end
  resources :outfit_products, only: [:destroy]
  resources :outfit_products, only: :update, defaults: { format: :json }

  resources :products, only: [:create, :show] do
    resources :closet_items, only: [:create, :destroy]
  end
end
