Rails.application.routes.draw do

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
