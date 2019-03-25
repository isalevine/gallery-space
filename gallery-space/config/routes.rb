Rails.application.routes.draw do
  resources :friends
  resources :settings
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
