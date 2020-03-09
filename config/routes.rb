Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :edit, :update, :show] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  get 'search' => 'search#search'
  get 'home/about' => 'homes#about'

end
