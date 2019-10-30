Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :pets, only: [:index, :show, :new, :create, :edit, :update]
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
  
  get '/apply' => 'pets#application'

  resources :shelters, only: [:show] do
    resources :pets, only: [:show, :index]
  end

  patch 'pets/:id', to: 'pets#update'
  get '/pets/:id/apply', to: 'pets#edit'
  patch '/pets/:id/apply', to: 'pets#update'


  get "/auth/google_oauth2", to: 'sessions#googleAuth'
  get '/auth/failure', to: redirect('/')



  root 'users#welcome'

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

end
