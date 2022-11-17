Rails.application.routes.draw do
  get 'welcome/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'users/show'
  root 'users#index'
  devise_for :users
  resources :events
  resources :send_mails
  resources :welcome
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
