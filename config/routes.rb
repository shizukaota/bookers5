Rails.application.routes.draw do

  devise_for :users
  resources :users, only:[:index,:show,:edit,:update]
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:edit,:create, :show, :destroy, :update, :index]
  get '/about'=>'books#about'
  root to: "books#top"
end

