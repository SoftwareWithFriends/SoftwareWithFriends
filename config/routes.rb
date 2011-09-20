Software::Application.routes.draw do
  resources :pages
  resources :posts
  root :to => 'pages#show', :id => 'Development'
  
  #root :to => 'posts#index'
end
