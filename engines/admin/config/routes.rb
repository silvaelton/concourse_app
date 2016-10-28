
Admin::Engine.routes.draw do

  root 'projects#index'

  resources :sessions, only: [:new, :create] do 
    collection do 
      delete 'logout'
    end
  end

  get  'edit_profile', to: 'profile#edit'
  post 'edit_profile', to: 'profile#update'
  
  resources :users
  resources :billings

  resources :projects do 
    resources :pages 
    resources :navs
    resources :subscribes do 
      get 'update_paid'
    end
    
    resources :popups
    resources :informs
    resources :bills
    resources :participations
    resources :winners
    
    resources :consults do 
      get 'next_situation'
    end

    resources :resources
  end

end
