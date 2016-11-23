Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'

  get 'newSignUp', to: 'signups#new'
  post 'newSignUp', to: 'signups#create'

  resources :signups

end
