Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
    resources :clubs, :books
    root "home#index"
end
