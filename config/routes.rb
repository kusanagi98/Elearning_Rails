Rails.application.routes.draw do
  get 'students/new'
  resources :posts
  resources :elearning
  resources :students
  get  '/signup',  to: 'students#new'
  post '/signup',  to: 'students#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
