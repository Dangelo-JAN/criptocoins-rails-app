Rails.application.routes.draw do
  root 'users#index'
  
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show]
    resources :posts, only: [:index, :show, :new, :create]
    post "/likes/:id/like" => "likes#like", as: :likes
    post "/comments/:id/comment" => "comments#comment", as: :comments
  end
  
  resources :posts, only: [:new, :create]
end
