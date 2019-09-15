Rails.application.routes.draw do
  get 'books/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root :to => 'books#top'
resources :books
 get 'top' => 'books#top'

 get 'books/:id/edit' => 'books#edit', as: 'edit_post'
 patch 'books/:id' => 'books#update', as: 'update_post'
 delete 'books/:id' => 'boks#destroy', as: 'destroy_post'

end
