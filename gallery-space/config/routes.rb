Rails.application.routes.draw do
  root 'pages#main'

  resources :galleries
    get '/galleries/:id/gallery_deleted', to: 'galleries#gallery_deleted', as: 'gallery_deleted'

  resources :users do
    resources :galleries
    resources :friends
  end
  get '/users/:id/profile', to: 'users#show_your_profile', as: 'show_your_profile'


  resources :settings
  resources :images

  get '/view_galleries/search', to: 'galleries#search_for_galleries', as: "search_for_galleries"
  # POST for '/view_gallery/' to enable search function?
  # also, need a GET route for the search-results page??
  get '/view_galleries/:id', to: 'galleries#view_published_gallery', as: "view_published_gallery"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
