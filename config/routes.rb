Rails.application.routes.draw do
 
  devise_for :users
  resources :books, only: [:update, :index, :show, :edit]
  resources :users, only: [:show, :edit, :index, :update]
  
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
