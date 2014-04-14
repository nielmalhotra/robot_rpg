RobotRpg::Application.routes.draw do
  root :to => 'application#root'

  scope "/angular_templates" do
    get ':action', :controller => 'angular_templates'
  end

  resources :mechs, only: [:index, :create]
  resources :messages, only: [:index, :create, :destroy]
  get 'messages/unread_count', to: 'messages#unread_count'
  resources :user_sessions, only: [:create, :destroy]
  resources :users, only: [:create]
  resources :fights, only: [:create, :index] do
    collection do
      get :invited
    end
  end

  delete 'logout' => 'user_sessions#destroy', :as => :logout
end
