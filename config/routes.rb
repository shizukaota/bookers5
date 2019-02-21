Rails.application.routes.draw do
  get 'books/show'
  get 'books/index'
  get 'books/new'
  get 'books/edit'
  get 'books' =>'posts#create'
  get 'books'=>'book#index'
  get 'books/:id' => 'books#edit', as: 'edit_books'
  patch 'books/:id' =>'books#update', as: 'update_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books
end


