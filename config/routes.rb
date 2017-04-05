Rails.application.routes.draw do
  get 'departs', to: 'departs#index'
  get '/departs/name/:name', to: 'departs#name', as: 'departname'
  get '/departs/:id', to: 'departs#show', as: 'depart'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
