Rails.application.routes.draw do
  root 'home#index' #Login/Signup Page
  get '/login', to:'sessions#new' #get login info
  post '/login', to:'sessions#new' #post login info
  get '/logout', to:'sessions#destroy' #Logout
  get '/auth/facebook/callback', to: 'sessions#create_fb'
  get '/index', to:'restaurants#search'
  get '/show_popular', to:'restaurants#show_popular'
  post '/index', to:'restaurants#search'
  resources :home, only: [:index]
  resources :sessions, only: [:create]
  resources :users do
      resources :favorites
      post '/index', to:'favorites#search', as:'favorite_filter'
  end
  resources :restaurants
  resources :notes
end
