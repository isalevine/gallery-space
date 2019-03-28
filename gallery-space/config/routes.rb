Rails.application.routes.draw do
  root 'pages#main'

  post '/login', to: 'pages#create_session_login'
  get '/logged_in/', to: 'pages#main_logged_in'
  post '/logout', to: 'pages#destroy_session_logout'


  resources :users do
    resources :friends
    resources :galleries do
      resources :images
      resources :settings
    end
  end
    get '/users/:id/profile', to: 'users#show_your_profile', as: 'show_your_profile'
    get '/new_friend_confirmation', to: 'friends#new_friend_confirmation', as: 'new_friend_confirmation'
    get '/galleries/:id/gallery_deleted', to: 'galleries#gallery_deleted', as: 'gallery_deleted'


  # resources :settings


  get '/view_galleries/search', to: 'galleries#search_for_galleries', as: "search_for_galleries"
  # POST for '/view_gallery/' to enable search function?
  # also, need a GET route for the search-results page??
  get '/view_galleries/:id', to: 'galleries#view_published_gallery', as: "view_published_gallery"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
