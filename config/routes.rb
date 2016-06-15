Rails.application.routes.draw do
  namespace :account do
  get 'matches/show'
  end

  namespace :account do
  get 'messages/create'
  end

  namespace :account do
  get 'messages/new'
  end

  namespace :account do
  get 'messages/show'
  end

  namespace :account do
  get 'products/index'
  end

  namespace :account do
  get 'products/create'
  end

  namespace :account do
  get 'products/new'
  end

  namespace :account do
  get 'products/edit'
  end

  namespace :account do
  get 'products/show'
  end

  namespace :account do
  get 'products/update'
  end

  namespace :account do
  get 'products/destroy'
  end

  namespace :account do
  get 'pictures/index'
  end

  namespace :account do
  get 'pictures/create'
  end

  namespace :account do
  get 'pictures/new'
  end

  namespace :account do
  get 'pictures/edit'
  end

  namespace :account do
  get 'pictures/show'
  end

  namespace :account do
  get 'pictures/update'
  end

  namespace :account do
  get 'pictures/destroy'
  end

  namespace :account do
  get 'profiles/edit'
  end

  namespace :account do
  get 'profiles/show'
  end

  namespace :account do
  get 'profiles/update'
  end

  namespace :account do
  get 'profiles/show'
  end

  namespace :account do
  get 'profiles/edit'
  end

  get 'products/show'

  get 'products/show'

  get 'appreciations/new'

  get 'appreciations/create'

  get 'profiles/show'

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
      resources :pictures
    end

    resource :matches, only: [:index, :show] do
      resource :messages, only: [:show, :create, :new]
    end
  end
end
