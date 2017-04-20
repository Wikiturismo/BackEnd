Rails.application.routes.draw do
  resources :imgtowns
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :departs , only: [:show, :index] do
        collection do
          get '/name/:name', to: 'departs#name', as: 'departname'
          get '/name/:departname/towns/:page', to: 'towns#bydepart', as: 'departtowns'
          get '/name/:departname/places/:page', to: 'places#bydepart', as: 'departplaces'
          get '/name/:departname/imagedeparts/:page', to: 'imagedeparts#bydepart', as: 'departimages'
          get '/name/:departname/commenttowns/:page', to: 'commenttowns#bydepart', as: 'departcommenttowns'
          get '/name/:departname/commentplaces/:page', to: 'commentplaces#bydepart', as: 'departcommentplaces'
        end
      end

      resources :towns do
        collection do
          get '/name/:name', to: 'towns#name', as: 'townname'
          get '/name/:townname/comments/:page', to: 'commenttowns#bytown', as: 'towncomments'
          get '/name/:townname/places', to: 'places#bytown', as: 'townplaces'
          get '/name/:townname/commentplaces/:page', to: 'commentplaces#bytown', as: 'towncommentplaces'
          get '/airport/:airport/:page', to: 'towns#airport', as: 'townairport'
          get '/terminal/:transpterminal/:page', to: 'towns#terminal', as: 'townterminal'
          get '/temper/:avertemper/:page', to: 'towns#temper', as: 'towntemper'
          get '/name/:townname/imagetowns/:page', to: 'imagetowns#bytown', as: 'townimages'
        end
      end

      resources :places do
        collection do
          get '/top', to: 'places#top', as:'placetop'
          get '/last', to: 'places#last', as:'placelast'
          get '/random', to: 'places#random', as: 'placerandom'
          get '/name/:name', to: 'places#name', as: 'placename'
          get '/valoration/:valoration/:page', to: 'places#valoration', as: 'placevaloration'
          get '/cost/:entrycost/:page', to: 'places#cost', as: 'placecost'
          get '/date/:page', to: 'places#date', as: 'placedate'
          get '/kind/:kind/:page', to: 'places#kind', as: 'placekind'
          get '/name/:placename/imageplaces/:page', to: 'imageplaces#byplace', as: 'placeimages'
          get '/name/:placename/comments', to: 'commentplaces#byplace', as: 'placecomments'
          get '/name/:placename/schedules/:page', to: 'schedules#byplace', as: 'placeschedules'
        end
      end

      resources :users do
       collection do
         get '/name/:name', to: 'users#name', as: 'username'
         get '/name/:username/commenttowns/:page', to: 'commenttowns#byuser', as: 'usercommenttowns'
         get '/name/:username/commentplaces/:page', to: 'commentplaces#byuser', as: 'usercommentplaces'
         get '/email/:eemail', to: 'users#mail', as: 'usermail'
         get '/kind/:kin/:page', to: 'users#ukind', as: 'userkind'
       end
     end

     resources :imagedeparts
     resources :imageplaces
     resources :commentplaces do
       collection do
         get '/state/:state/:page', to: 'commentplaces#state', as: 'placecomments'
         get '/date/:page', to: 'commentplaces#date', as:'placecommentsdate'
       end
     end
     resources :commenttowns do
      collection do
        get '/state/:state/:page', to: 'commenttowns#state', as: 'towncomments'
        get '/date/:page', to: 'commenttowns#date', as:'towncommentsdate'
      end
     end
     resources :imagetowns
     resources :schedules
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
end
