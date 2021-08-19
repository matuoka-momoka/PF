Rails.application.routes.draw do
  devise_for :users
 get '/search' => 'searches#search'
  root :to => "homes#top"
  get "home/about" => "homes#about"
 delete "mensores/:id/bookmarks"=> "bookmarks#destroy", as: "bookmarks"
  post "mensores/:id/bookmarks"=> "bookmarks#create", as: "bookmark"
  resources :mensores, only: [:index, :show, :edit, :create, :destroy, :update] do
 
 
  resources :mensore_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :relationships, only: [:create, :destroy]
end


