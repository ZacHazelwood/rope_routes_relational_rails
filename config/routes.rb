Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/gyms', to: 'gyms#index'
  post '/gyms', to: 'gyms#create'
  get '/gyms/new', to: 'gyms#new'
  get '/gyms/:id', to: 'gyms#show'

  patch '/gyms/:id', to: 'gyms#update'
  get '/gyms/:id/edit', to: 'gyms#edit'

  get '/gyms/:id/rope_routes', to: 'gym_rope_routes#index'
  post '/gyms/:id/rope_routes', to: 'gym_rope_routes#create'
  get '/gyms/:id/rope_routes/new', to: 'gym_rope_routes#new'

  get '/rope_routes', to: 'rope_routes#index'
  get '/rope_routes/:id', to: 'rope_routes#show'

end
