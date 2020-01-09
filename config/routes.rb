Rails.application.routes.draw do


  root 'home#top'
  get "/home/about", to:'home#about'
  devise_for :customers
  resource :customer, only: [:show, :edit, :update]
  resources :items, only: [:index, :show]
  delete "/cart_items/empty", to:'cart_items#empty_cart'
  resources :cart_items, only: [:index, :create, :update, :destroy]
  get "/orders/confirm", to:"orders#confirm"
  get "/orders/done", to:"orders#done"
  resources :orders, only: [:index, :show, :new, :create]
  resources :shippings, except: [:show]


  namespace :admin do
  devise_for :admins, controllers: {
    sessions:      'devise/admin/sessions',
    passwords:     'devise/admin/passwords',
   registrations: 'devise/admin/registrations'
  }
  root 'home#top'
  resources :items, except: [:destroy]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:index, :show, :update]
  resources :genres, only: [:index, :create, :edit, :update]

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
