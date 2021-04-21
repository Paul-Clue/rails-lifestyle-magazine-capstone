Rails.application.routes.draw do
  resources :articles
  root to: "sessions#welcome"
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to:'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  post 'articles/:id', to: 'vote#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
