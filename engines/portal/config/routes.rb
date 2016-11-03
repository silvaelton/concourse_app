Portal::Engine.routes.draw do
  root 'projects#index'


  resources :projects, path: '/' do 
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

      resources :participations, path: 'participacao'
    end
  end
end
