
Admin::Engine.routes.draw do

  root 'dashboard#index'

  resources :sessions, only: [:new, :create]

  get  'edit_profile', to: 'profile#edit'
  post 'edit_profile', to: 'profile#update'
  
  resources :users
  resources :bills

  resources :projects do 
    resources :pages 
    resources :navs
    resources :subscribes
    resources :popups
    resources :informs
  end

end
