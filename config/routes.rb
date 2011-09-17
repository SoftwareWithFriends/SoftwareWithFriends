Software::Application.routes.draw do
  resources :pages, :only => ['show']
end
