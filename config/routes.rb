Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :pets
  resources :shelters
  resources :sessions

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  post '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/mypage' => 'users#show'
  get '/home' => 'users#show'

  resources :shelters, only: [:show] do
    resources :pets, only: [:show, :index]
  end
 

  root 'users#welcome'
end
