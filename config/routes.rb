RobotRpg::Application.routes.draw do
  root :to => 'home#index'

  resources :user_sessions, only: [:create, :destroy]

  resources :users, only: [:create]

  get 'logout' => 'user_sessions#destroy', :as => :logout
end
