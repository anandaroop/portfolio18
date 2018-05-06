Rails.application.routes.draw do
  namespace :admin do
    resources :clients
    resources :projects
    resources :slides
    resources :tags

    root to: 'clients#index'
  end
end
