Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  #as a user

  resources :profiles, only: [:show]

  resources :products, only: [:show] do
    resource :appreciations, only: [:new, :create]
  end

  namespace :account do
    resource :profile, only: [:show, :edit, :update]

    resources :products do
      resources :media
    end

    resource :matches, only: [:index, :show] do
      resource :messages, only: [:show, :create, :new]
    end
  end
end
