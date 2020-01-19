Rails.application.routes.draw do


  root 'home#top'
  get "/home/about", to:'home#about'
  get "/customer/leave", to:'customers#leave'
  devise_for :customers, controllers: {
    sessions:      'devise/customers/sessions',
    passwords:     'devise/customers/passwords',
    registrations: 'devise/customers/registrations'
  }
  resource :customer, only: [:show, :edit, :update, :destroy]
  resources :items do
    get '/autocomplete_name/:name', on: :collection, action: :autocomplete_name
  end
  delete "/cart_items/empty", to:'cart_items#empty_cart'
  resources :cart_items, only: [:index, :create, :update, :destroy]
  get "/orders/confirm", to:"orders#confirm"
  get "/orders/done", to:"orders#done"
  resources :orders, only: [:index, :show, :new, :create]
  resources :shippings, except: [:show]

 devise_for :admins, controllers: {
    sessions:      'devise/admin/sessions',
    passwords:     'devise/admin/passwords',
   registrations: 'devise/admin/registrations'
  }

  namespace :admin do

  root 'home#top'
  resources :items, except: [:destroy]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:index, :show, :update]
  resources :genres, only: [:index, :create, :edit, :update]

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
