Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/songs', to: 'songs#index'
  get '/songs/:id', to: 'songs#show'

  # get '/artists', to: 'artists#index'
  # get '/artists/new', to: 'artists#new'
  # post '/artists', to: 'artists#create'
  # delete '/artists/:id', to: 'artists#destroy'
  # get '/artists/:id/edit', to: 'artists#edit'
  # patch '/artists/:id', to: 'artists#update'
  resources :artists
  resources :playlists, only: :index

  #cart
  patch '/cart/:song_id', to: 'cart#add_song', as: "cart"
end
