Rails.application.routes.draw do
  resources :posts
  resources :elearning
  resources :students
  get  '/signup',  to: 'students#new'
  post '/signup',  to: 'students#create'
  post 'elearning/new', to: 'elearning#create' #new path for create
  patch 'elearning/:id/edit', to: 'elearning#update', as: "elearning_id_edit"
  put 'elearning/:id/edit', to: 'elearning#update', as: "elearning_id_update"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
