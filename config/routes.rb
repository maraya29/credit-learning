CreditLearning::Application.routes.draw do
  
  resources :users
  
  resources :user_sessions

  get  'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  get  'logout' => 'user_sessions#destroy'
  
  get  'home' => 'application#index'
  
  get 'application/change_theme/:theme_name' => 'application#change_theme', :as => 'change_theme'
  get 'application/set_locale/:lenguaje' => 'application#set_locale', :as => 'set_locale'

  root to: "user_sessions#new"
  
end
