Rails.application.routes.draw do
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  root 'welcome#index'
  resources :users
  resources :articles do
    resources :comments
  end
end
