Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      resources :departs , except: [:create, :delete, :patch] do
        collection do
          get '/name', to: 'departs#name', as: 'departname'
          get '/towns', to: 'towns#bydepart', as: 'departtowns'
          get '/places', to: 'places#bydepart', as: 'departplaces'
          get '/commenttowns', to: 'commenttowns#bydepart', as: 'departcommenttowns'
          get '/commentplaces', to: 'commentplaces#bydepart', as: 'departcommentplaces'
          get '/images', to: 'imagedeparts#bydepart', as: 'departimages'
        end
      end

      resources :valorations do
        collection do
          get '/val', to: 'valorations#val', as: 'valorations'
          get '/userplace', to: 'valorations#userplace', as: 'userplace'
        end
      end

      resources :towns do
        collection do
          get '/count', to: 'towns#count', as: 'towncount'
          get '/name', to: 'towns#name', as: 'townname'
          get 'comments', to: 'commenttowns#bytown', as: 'towncomments'
          get '/places', to: 'places#bytown', as: 'townplaces'
          get '/commentplaces', to: 'commentplaces#bytown', as: 'towncommentplaces'
          get '/airport', to: 'towns#airport', as: 'townairport'
          get '/terminal', to: 'towns#terminal', as: 'townterminal'
          get '/temper', to: 'towns#temper', as: 'towntemper'
          get '/images', to: 'imagetowns#bytown', as: 'townimages'
          get '/lastbydepart', to: 'towns#lastbydepart', as: 'townslastdepart'
        end
      end

      resources :places do
        collection do
          get '/count', to: 'places#count', as: 'placecount'
          get '/top', to: 'places#top', as:'placetop'
          get '/last', to: 'places#last', as:'placelast'
          get '/random', to: 'places#random', as: 'placerandom'
          get '/name', to: 'places#name', as: 'placename'
          get '/valoration', to: 'places#valoration', as: 'placevaloration'
          get '/cost', to: 'places#cost', as: 'placecost'
          get '/date', to: 'places#date', as: 'placedate'
          get '/kind', to: 'places#kind', as: 'placekind'
          get '/comments', to: 'commentplaces#byplace', as: 'placecomments'
          get '/schedules', to: 'schedules#byplace', as: 'placeschedules'
          get '/images', to: 'imageplaces#byplace', as: 'placeimages'
          get '/lastbytown', to: 'places#lastbytown', as: 'placelasttown'
        end
      end

      resources :users do
       collection do
         get '/count', to: 'users#count', as: 'usercount'
         get '/name', to: 'users#name', as: 'username'
         get '/commenttowns', to: 'commenttowns#byuser', as: 'usercommenttowns'
         get '/commentplaces', to: 'commentplaces#byuser', as: 'usercommentplaces'
         get '/email', to: 'users#mail', as: 'usermail'
         get '/kind', to: 'users#ukind', as: 'userkind'
         get '/images', to: 'imageusers#byuser', as: 'userimages'
       end
     end

     resources :imagedeparts
     resources :imageplaces do
       collection do
         get '/count', to: 'imageplaces#count', as: 'imageplacescount'
      end
     end
     resources :imagetowns do
       collection do
         get '/count', to: 'imagetowns#count', as: 'imagetownscount'
       end
     end
     resources :schedules
     resources :imageusers

     resources :commentplaces do
       collection do
         get '/count', to: 'commentplaces#count', as: 'commentplacecount'
         get '/state', to: 'commentplaces#state', as: 'placecomments'
         get '/date', to: 'commentplaces#date', as:'placecommentsdate'
       end
     end
     resources :commenttowns do
      collection do
        get '/count', to: 'commenttowns#count', as: 'commenttownscount'
        get '/state', to: 'commenttowns#state', as: 'towncomments'
        get '/date', to: 'commenttowns#date', as:'towncommentsdate'
      end
     end
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
end
