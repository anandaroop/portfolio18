Rails.application.routes.draw do
  root to: 'pages#projects'

  namespace :admin do
    resources :clients
    resources :projects
    resources :slides
    resources :tags

    root to: 'clients#index'
  end

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' # if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
end
