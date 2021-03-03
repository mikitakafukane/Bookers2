Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources:book_comments,only:[:create, :destroy]
    resource:favorites, only:[:create, :destroy]
  end

  resources :users do
    get :following
    get :follower
  end


  get "home/about" => "homes#about", as: "about"

  post 'follow/:id' => 'relationships#create', as: 'follow'
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'


end
