Software::Application.routes.draw do
  resources :pages, :only => ['show']
  root :to => 'pages#show', :id => 'home'
end
