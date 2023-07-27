Rails.application.routes.draw do

  # User

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
    get 'users/edit', to: 'devise/registrations#edit'
  end

  resources :users, only: [] ,shallow: true do
    member do
      get 'tab_photos',  as: 'photos'
      get 'tab_albums',  as: 'albums'
      get 'tab_followers', as: 'followers'
      get 'tab_followings', as: 'followings'
    end
  end

  # Photo-Album
  scope :users do
    resources :photos, :albums, except: [:index, :show]
    resources :messages, only: [:index, :create]
    post '/like_photo/:id/:is_like', to: 'likes#like_photo', as: 'like_photo'
    post '/like_album/:id/:is_like', to: 'likes#like_album', as: 'like_album'
  end

  # Follow
  delete '/follows/:id', to: 'follows#destroy', as: 'follow'
  post '/follows/:id/:is_profile', to: 'follows#create', as: 'follows'

  # Home
  get 'home/feed/:category', to: 'home#feed', as: 'home_feed'
  get 'home/discover/:category', to: 'home#discover', as: 'home_discover'
  
  # Admin 
  namespace :admin do
        resources :users , except: [:show, :new, :create]
        resources :photos, only: [:index]
        resources :albums, only: [:index]
  end
 
  # Defines the root path route ("/")
  match '*path', to: 'home#feed', via: :all
  root "home#feed"
end


