Rails.application.routes.draw do
    resources :clubs
    root "home#index"
end
