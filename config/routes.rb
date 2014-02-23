RobotRpg::Application.routes.draw do
  root :to => 'application#root'

  scope "/angular_views" do
    get ':action', :controller => 'angular_views'
  end

  resources :robots, only: [:index, :create]
  resources :user_sessions, only: [:create, :destroy]
  resources :users, only: [:create]

  delete 'logout' => 'user_sessions#destroy', :as => :logout
end
