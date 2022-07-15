Rails.application.routes.draw do
  root 'pages#hello'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  resources :posts, only: [:new, :create]
end
