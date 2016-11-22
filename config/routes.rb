  Rails.application.routes.draw do
    root'demo_pages#home'
    get 'sessions/new'
    get 'users/new'
    get '/help', to: 'demo_pages#help'
    get '/about', to: 'demo_pages#about'
    get '/signup', to: 'users#signup'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    post '/signup',  to: 'users#create'
    delete 'logout', to:'sessions#destroy'
    get '/edit', to:'users#edit'
    get '/search', to: 'users#index'

    get '/entry', to: 'demo_pages#entry'
    get '/show', to: 'demo_pages#show'
    
    get '/comment', to: 'comments#index'
    resources :users do
    member do
      get :following, :followers
    end
  end
    resources :microposts
    resources :relationships, only: [:create, :destroy]
    resources :comments
  end
