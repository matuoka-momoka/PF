Rails.application.routes.draw do
  get 'seach/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"

  resources :mensores, only: [:index, :show, :edit, :create, :destroy, :update] do
  resources :bookmarks, only: [:create, :destroy]
  resources :mensore_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
end
