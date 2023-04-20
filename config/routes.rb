Rails.application.routes.draw do
  root "articles#index"
  resources :subscription, :answers, :advertisement, :baners, :surveys, :survey_answers

  resources :category do
    resources :team, only: [:index, :show]
    resources :article, only: [:index, :show]
  end
  resources :team, only: [:index, :show] do
    resources :articles, only: [:index, :show]
  end
  resources :category, only: [:new, :create, :edit, :update, :destroy]
  resources :team, only: [:new, :create, :edit, :update, :destroy]
  resources :articles do
    resources :comments
  end

  
  # ActiveAdmin.routes(self)
  
  # devise_for :users, ActiveAdmin::Devise.config
  
  
  devise_for :admin, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)    
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]

  # ActiveAdmin.routes(self)
  

  
 
  
end
