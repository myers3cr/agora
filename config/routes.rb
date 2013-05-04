Agora::Application.routes.draw do

  root :to => 'main#index'
  get "main" => 'main#index'
  resources :jobs
    resources :open_items
    resources :commercial_print


  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  namespace :admin do
    resources :currencies
    resources :messages
    resources :orgs
    resources :users
  end
 
end
