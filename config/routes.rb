Rails.application.routes.draw do
  resources :articles, only: %i[new show create edit destroy]
  resources :categories, only: %i[new show]
  root to: 'users#new'
  resources :users, only: %i[new create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'articles#welcome'
  post 'categories/:id', to: 'vote#create'
  get 'authorized', to: 'sessions#page_requires_login'
  post 'articles/:id', to: 'vote#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
