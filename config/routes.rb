Rails.application.routes.draw do
  
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

  post 'comments_reactions/update'
  
  
  devise_for :users
 
  root "articles#index"
end
