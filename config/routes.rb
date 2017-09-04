Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :users, :only => [:show]
  
    resources :clubs do
      resources :announcements
      resources :members, :controller => "memberships" do
        post "make_admin"
        post "del_admin"
      end
      resources :books do
        resources :discussions do
          delete "destroy"
          resources :comments do
            delete "destroy"
          end
        end
      end
    end
    
    root "home#index"

    get '*unmatched_route', to: 'errors#not_found'
end
