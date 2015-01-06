Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"

  get '/api/csrf', to: 'csrf#index'

  devise_for :users, controllers: { sessions: 'sessions' }

  root to: 'site#index'
end
