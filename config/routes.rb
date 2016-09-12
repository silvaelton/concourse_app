Rails.application.routes.draw do

  mount Admin::Engine   => '/gestao'
  mount Portal::Engine  => '/'

end
