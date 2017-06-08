Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
    resources :clubs
    root "home#index"
end
