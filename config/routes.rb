Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tutorials, only:[:show, :index]
      resources :videos, only:[:show]
    end
  end

  root 'welcome#index'
  get 'tags/:tag', to: 'welcome#index', as: :tag
  get '/register', to: 'users#new'
  get '/auth/github/callback', to: 'sessions#update'

  namespace :admin do
    get "/dashboard", to: "dashboard#show"

    resources :tutorials, only: [:create, :edit, :update, :destroy, :new] do
      resources :videos, only: [:create, :destroy]
    end

    resources :videos, only: [:edit, :update, :destroy]

    resources :playlists, only: [:new, :create]

    namespace :api do
      namespace :v1 do
        put "tutorial_sequencer/:tutorial_id", to: "tutorial_sequencer#update"
      end
    end
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  post "/email", to: "email#create"
  get "/user/:user_id/email", to: "email#index", as: :emails

  get '/dashboard', to: 'users#show'
  get '/about', to: 'about#show'
  get '/get_started', to: 'get_started#show'


  get '/invite', to: 'invite#new'

  post '/friendships', to: 'friendships#create'

  # Is this being used?
  get '/video', to: 'video#show'

  resources :users, only: [:new, :create, :update, :edit]

  resources :tutorials, only: [:show, :index] do
    resources :videos, only: [:show, :index]
  end

  resources :user_videos, only:[:create, :destroy]
end
