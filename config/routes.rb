Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/gyms', to: 'gyms#index'
  post '/gyms', to: 'gyms#create'
  get '/gyms/new', to: 'gyms#new'
  get '/gyms/:id', to: 'gyms#show'

  get '/rope_routes', to: 'rope_routes#index'
  get '/rope_routes/:id', to: 'rope_routes#show'
  get '/gyms/:gym_id/rope_routes', to: 'gym_rope_routes#index'

end
