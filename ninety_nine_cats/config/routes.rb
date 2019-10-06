Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cats, except: [:destroy] do 
    resources :cat_rental_requests, only: [:new]
  end

  resources :cat_rental_requests, only: [:create]
end
