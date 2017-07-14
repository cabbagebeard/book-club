Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
    resources :clubs do
      resources :books
    end
    
    root "home#index"

    get '*unmatched_route', to: 'errors#not_found'
end
