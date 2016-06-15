  Rails.application.routes.draw do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

    root to: 'pages#home'
    mount Attachinary::Engine => "/attachinary"

  #as a user

  resources :profiles, only: [:show]

  resources :products, only: [:show] do
    resource :appreciations, only: [:new, :create]
  end

  namespace :account do
    resource :profile, only: [:show, :edit, :update]

    resources :products


    resource :matches, only: [:index, :show] do
      resource :messages, only: [:show, :create, :new]
    end
  end
end
