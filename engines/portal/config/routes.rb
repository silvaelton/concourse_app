Portal::Engine.routes.draw do
  root 'projects#index'

  resources :projects, path: '/' do 
    resources :pages,    path: 'paginas'
    resources :consults, path: 'consultas'
  end
end
