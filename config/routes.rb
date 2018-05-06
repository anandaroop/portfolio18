Rails.application.routes.draw do
  namespace :admin do
      resources :clients
      resources :projects
      resources :slides
      resources :tags

      root to: "clients#index"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
