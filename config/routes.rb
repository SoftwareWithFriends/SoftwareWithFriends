Software::Application.routes.draw do
  resources :pages
  resources :posts
  resources :dashbaords
  
  root :to => 'dashboards#index'
end
