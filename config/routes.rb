Rails.application.routes.draw do
  
  resources :goods
  resources :transactions, only: [:new, :create]

  get 'payment/new'

  get 'payment/show'

  get 'payment/_form'

  resources :schools
  resources :children 
  #logins 
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'



  resources :users do 
    post 'change_money' => 'users#change_money'
  end
  # get 'payment', to: 'users#payment', as: 'payment'
  # post "/checkout" => "users#index"

  #Pages
  get 'page/index'
  # root 'page#index'
  root :to => 'sessions#new'
  

end
