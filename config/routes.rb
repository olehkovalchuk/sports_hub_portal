Rails.application.routes.draw do
  resources :subscription, :answers, :advertisement, :baners, :surveys, :survey_answers, :comments, :users

  resources :category do
    resources :team, only: [:index, :show]
    resources :article, only: [:index, :show]
  end
  resources :team, only: [:index, :show] do
    resources :articles, only: [:index, :show]
  end
  resources :category, only: [:new, :create, :edit, :update, :destroy]
  resources :team, only: [:new, :create, :edit, :update, :destroy]
  resources :articles
  # resources :article, only: [:new, :create, :edit, :update, :destroy]
  post 'comments_reactions/update'
  
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
