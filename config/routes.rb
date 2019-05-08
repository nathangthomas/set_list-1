Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :songs, only: [:index, :show]

  # get '/songs', to: 'songs#index'
  # get '/songs/:id', to: 'songs#show'

  resources :artists, only: [:new, :create, :show] do
    resources :songs, only: [:new, :create]
  end

  # get '/artists/new', to: 'artists#new'
  # post '/artists', to: 'artists#create'
  # get '/artists/:id', to: 'artists#show'

  resources :playlists, only: :index

  # get '/playlists', to: "playlists#index"
end
