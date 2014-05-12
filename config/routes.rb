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
    member do
      get :begin
      post :invite
      post :accept
      get :deny
      scope '/battle', controller: 'battle' do
        get :status
      end
    end
    collection do
      get :past
      get :invited
      get :owned
      get :upcoming
      get :in_progress
    end
  end
  resources :events, only: [:index]

  delete 'logout' => 'user_sessions#destroy', :as => :logout
end
