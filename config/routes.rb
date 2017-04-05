Rails.application.routes.draw do
  resources :departs do
    collection do
      get '/name/:name', to: 'departs#name', as: 'departname'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
