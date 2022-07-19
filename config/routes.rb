Rails.application.routes.draw do
  root 'pages#hello'
  
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show]
  end

  # resources :posts, only: [:new, :create]
end
