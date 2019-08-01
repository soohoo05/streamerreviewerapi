Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :streamers
  resources :reviews
  get '/current_user', to: "auth#show"
  post '/login', to: 'auth#create'
  post '/newPhoto/:streamer_id', to: 'photos#create'
end
