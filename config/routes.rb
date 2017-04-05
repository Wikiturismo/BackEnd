Rails.application.routes.draw do
  resources :departs do
    collection do
      get '/name/:name', to: 'departs#name', as: 'departname'
      get '/name/:departname/towns', to: 'towns#bydepart', as: 'departtowns'
      get '/name/:departname/places', to: 'places#bydepart', as: 'departplaces'
      get '/name/:departname/imagedeparts', to: 'imagedeparts#bydepart', as: 'departimages'
      get '/name/:departname/commenttowns', to: 'commenttowns#bydepart', as: 'departcommenttowns'
      get '/name/:departname/commentplaces', to: 'commentplaces#bydepart', as: 'departcommentplaces'
    end

  end

  resources :towns do
    collection do
      get '/name/:name', to: 'towns#name', as: 'townname'
      get '/name/:townname/comments', to: 'commenttowns#bytown', as: 'towncomments'
      get '/name/:townname/places', to: 'places#bytown', as: 'townplaces'
      get '/name/:townname/commentplaces', to: 'commentplaces#bytown', as: 'towncommentplaces'
      get '/airport/:airport', to: 'towns#airport', as: 'townairport'
      get '/terminal/:transpterminal', to: 'towns#terminal', as: 'townterminal'
      get '/temper/:avertemper', to: 'towns#temper', as: 'towntemper'
      get '/name/:townname/imagetowns', to: 'imagetowns#bytown', as: 'townimages'
      resources :commenttowns do
        get '/state/:state', to: 'commenttowns#state', as: 'towncomments'
        get '/date', to: 'commenttowns#date', as:'towncommentsdate'
      end
    end
  end

  resources :places do
    collection do
      get '/name/:name', to: 'places#name', as: 'placename'
      get '/valoration/:valoration', to: 'places#valoration', as: 'placevaloration'
      get '/cost/:entrycost', to: 'places#cost', as: 'placecost'
      get '/date', to: 'places#date', as: 'placedate'
      get '/kind/:kind', to: 'places#kind', as: 'placekind'
      get '/name/:placename/imageplaces', to: 'imageplaces#byplace', as: 'placeimages'
      get '/name/:placename/comments', to: 'commentplaces#bytown', as: 'placecomments'
      resources :commentplaces do
        get '/state/:state', to: 'commentplaces#state', as: 'placecomments'
        get '/date', to: 'commentplaces#date', as:'placecommentsdate'
      end
    end
  end

  resources :users do
   collection do
     get '/name/:name', to: 'users#name', as: 'username'
     get '/name/:username/commenttowns', to: 'commenttowns#byuser', as: 'usercommenttowns'
     get '/name/:username/commentplaces', to: 'commentplaces#byuser', as: 'usercommentplaces'
     get '/email/:eemail', to: 'users#mail', as: 'usermail'
     get '/kind/:kin', to: 'users#ukind', as: 'userkind'
   end
 end

 resources :imagedeparts, only: [:show, :index]

 resources :imageplaces, only: [:show, :index]

 resources :imagetowns, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
