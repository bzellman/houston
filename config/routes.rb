Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "user_sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get 'newSignUp', to: 'signups#new'
  post 'newSignUp', to: 'signups#create'

  get 'newTrip', to: 'trips#new'
  post 'newTrip', to: 'trips#create'

  get 'trips/:id/send_itinerary' => 'trips#send_itinerary', as: :trips_send_itinerary


  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'


  resources :signups
  resources :tripitems
  resources :trips

end
