Rails.application.routes.draw do
  resources :articles, :subscription, :answers, :advertisements, :categorys, :teams, :baners, :surveys, :survey_answers, :comments, :users


  post 'comments_reactions/update'
  
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
