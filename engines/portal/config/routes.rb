Portal::Engine.routes.draw do
  root 'projects#index'


  resources :projects, path: '/' do 

    get 'participacoes', to: 'participations#all'
    get 'vencedores',    to: 'participations#winners'
    
    resources :informs,    path: 'informes'
    resources :pages,      path: 'paginas'
    resources :consults,   path: 'consultas'
    resources :subscribes, path: 'inscricao' do 
      collection do 
        get 'success', path: 'sucesso'
      end
    end

    namespace :candidate_area, path: 'area_candidato' do 
      root 'dashboard#index'
      
      resources :sessions, path: 'acesso' do 
        collection do 
          delete 'logout'
        end
      end

      resources :passwords, path: 'lembrar-senha' do 
        get 'remember'
        get 'success'
      end

      resources :billets, path: 'boleto' do 
        collection do 
          get 'generate', path: 'gerar'
        end
      end
      
      resources :subscribes, only: [:edit, :update], as: 'candidate_subscribe'

      resources :participations, path: 'participacao' do 
        collection do 
          post 'upload_document'
        end
      end

      resources :subscribe_teams do 
        collection do 
          get  'new_required', as: 'new_required'
          post 'create_required', as: 'create_required'
  
          get 'new_optional', as: 'new_optional'
          post 'create_optional', as: 'create_optional'
        end
      end
    end
  end
end
