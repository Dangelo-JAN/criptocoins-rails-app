Rails.application.routes.draw do
  root 'pages#hello'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end

  # resources :posts, only: [:new, :create]
end
