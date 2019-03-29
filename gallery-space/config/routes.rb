Rails.application.routes.draw do
  root 'pages#main'

  post '/login', to: 'pages#create_session_login'
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


  get '/view_galleries/search', to: 'galleries#search_for_galleries', as: "search_for_galleries"
  post '/view_galleries/search', to: "galleries#search_results", as: "search_results"
  # also, need a GET route for the search-results page??
  get '/view_galleries/:id', to: 'galleries#view_published_gallery', as: "view_published_gallery"
  get '/view_galleries/:id/image_details', to: 'galleries#view_image_details', as: "view_image_details"


  # deletion and deletion-confirmation-page routes
  get '/users/:id/user_deleted', to: 'users#user_deleted', as: "user_deleted"
  get '/users/:id/friends/:id/friend_deleted', to: 'friends#friend_deleted', as: "friend_deleted"
  get '/users/:id/galleries/:id/gallery_deleted', to: 'galleries#gallery_deleted', as: "gallery_deleted"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
