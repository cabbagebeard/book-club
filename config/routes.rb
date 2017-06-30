Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
    resources :clubs, :books
    root "home#index"
    
    get '*unmatched_route', to: 'error#not_found'
end
