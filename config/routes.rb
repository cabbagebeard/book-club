Rails.application.routes.draw do
  devise_for :users
    resources :clubs
    root "home#index"
end
