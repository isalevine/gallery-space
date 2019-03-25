Rails.application.routes.draw do
  resources :galleries
    get '/galleries/:id/gallery_deleted', to: 'galleries#gallery_deleted', as: 'gallery_deleted'

  resources :users
  resources :friends
  resources :settings
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
