
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
    resources :subscribe_custom_participations
    resources :subscribes do 
      resources :subscribe_observations
      get 'update_paid'
    end

    
    resources :popups
    resources :informs
    resources :bills
    resources :participations do 
      collection do 
        get 'show_candidates'
      end
    end

    resources :documents
    resources :winners
    
    resources :consults do 
      get 'next_situation'
    end

    resources :resources
  end

end
