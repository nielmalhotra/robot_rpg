RobotRpg::Application.routes.draw do
  root :to => 'application#root'

  scope "/angular_views" do
    get ':action', :controller => 'angular_views'
  end

  resources :mechs, only: [:index, :create]
  resources :messages, only: [:index, :create]
  get 'messages/unread_count', to: 'messages#unread_count'
  resources :user_sessions, only: [:create, :destroy]
  resources :users, only: [:create]

  delete 'logout' => 'user_sessions#destroy', :as => :logout
end
