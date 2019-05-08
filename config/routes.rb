Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'welcome#index', as: :welcome

  root to: 'welcome#index'

  resources :songs, only: [:index, :show]

  # get '/songs', to: 'songs#index'
  # get '/songs/:id', to: 'songs#show'

  get '/artists/new', to: 'artists#new'
  post '/artists', to: 'artists#create'
  get '/artists/:id', to: 'artists#show'

  get '/playlists', to: "playlists#index"

end
