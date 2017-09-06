Rails.application.routes.draw do
  devise_for :users,
  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:create, :show]
  end
end
 
