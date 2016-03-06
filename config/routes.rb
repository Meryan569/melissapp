Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users

  resources :products do
    resources :comments
  end
  
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/index'
  get 'static_pages/landing_page'

  post 'static_pages/thank_you'
  post 'payments/create'
 
  root 'static_pages#index'
end