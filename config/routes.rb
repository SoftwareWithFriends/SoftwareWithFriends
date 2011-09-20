Software::Application.routes.draw do
  resources :pages
  resources :posts
  #root :to => 'pages#show', :id => 'home'
  
  root :to => 'posts#index'
end
