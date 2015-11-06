Rails.application.routes.draw do
  apipie
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'site#home'
  get 'about' => 'site#about'
  get 'test' => 'site#candidates_csv'

  resources :parties, only: [:index, :show]
  resources :candidates, only: [:index, :show]
  resources :constituencies, only: [:index, :show]
end
