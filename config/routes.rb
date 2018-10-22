Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :cubes
  devise_for :views
  devise_for :users, controllers: {
  	registrations: 'registrations'
  }
  root 'cubes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
