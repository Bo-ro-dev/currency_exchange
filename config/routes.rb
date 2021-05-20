Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'exchange#show'
  resource :exchange, only: [:show]
  get '/show', to: 'exchange#show'
end
