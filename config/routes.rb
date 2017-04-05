Rails.application.routes.draw do
  resources :departs do
    collection do
      get '/name/:name', to: 'departs#name', as: 'departname'
      get '/name/:name/towns', to: 'towns#depart', as: 'departtowns'
      get '/name/:name/places', to: 'places#depart', as: 'departplaces'
      get '/name/:departname/imagedeparts', to: 'imagedeparts#bydepart', as: 'imagedepart'
    end

  end

  resources :towns do
    collection do
      get '/name/:name', to: 'towns#name', as: 'townname'
      get '/name/:name/places', to: 'place#town', as: 'townplaces'
      get '/airport/:airport', to: 'towns#airport', as: 'townairport'
      get '/terminal/:transpterminal', to: 'towns#terminal', as: 'townterminal'
      get '/temper/:avertemper', to: 'towns#temper', as: 'towntemper'
    end
  end

  resources :places do
    collection do
      get '/name/:name', to: 'places#name', as: 'placename'
      get '/valoration/:valoration', to: 'places#valoration', as: 'placevaloration'
      get '/cost/:entrycost', to: 'places#cost', as: 'placecost'
      get '/date', to: 'places#date', as: 'placedate'
      get '/kind/:kind', to: 'places#kind', as: 'placekind'
    end
  end
  
  resources :users do
   collection do
     get '/name/:name', to: 'users#name', as: 'username'
     get '/email/:eemail', to: 'users#mail', as: 'usermail'
     get '/kind/:kin', to: 'users#ukind', as: 'userkind'
   end
 end

 resources :imagedeparts, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
