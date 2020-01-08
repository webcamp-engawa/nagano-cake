Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

namespace :admin do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
