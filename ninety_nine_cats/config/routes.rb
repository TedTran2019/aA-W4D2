Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cats, except: [:destroy]

  resources :cat_rental_requests, only: [:create, :new] do 
    member do
      post 'approve'
      post 'deny'
    end
  end
end
