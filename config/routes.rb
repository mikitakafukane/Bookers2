Rails.application.routes.draw do
  devise_for :users
  
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources:book_comments,only:[:create, :destroy]
    resource:favorites, only:[:create, :destroy]
  end
  
  resources :users
  get "home/about" => "homes#about", as: "about"
  
end
