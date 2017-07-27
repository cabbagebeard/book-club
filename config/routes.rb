Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
    resources :clubs do
      resources :members, :controller => "memberships" do
        post "make_admin"
        post "del_admin"
      end
      resources :books do
        resources :discussions do
          resources :comments
        end
      end
    end
    
    root "home#index"

    get '*unmatched_route', to: 'errors#not_found'
end
