Rails.application.routes.draw do
  devise_for :users
 get '/search' => 'searches#search'
  root :to => "homes#top"
  get "home/about" => "homes#about"
 delete "mensores/:id/bookmarks"=> "bookmarks#destroy", as: "bookmarks"
  post "mensores/:id/bookmarks"=> "bookmarks#create", as: "bookmark"
  resources :boards, only: %i[index new create show edit destroy update], shallow: true do
   get :bookmarks, on: :collection
   resource :bookmarks, only: %i[create destroy]
  end
  
  resources :mensores, only: [:index, :show, :edit, :create, :destroy, :update] do
  resources :mensore_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]do
   resources :bookmarks, only: [:index]
  end
  resources :relationships, only: [:create, :destroy]
  
  get  'inquiry' => 'inquiry#index'              
  post 'inquiry/confirm' => 'inquiry#confirm'   
  post 'inquiry/thanks' => 'inquiry#thanks'
end
