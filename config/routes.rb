Rails.application.routes.draw do
  devise_for :users, skip: :root

  resources :users, only: [:index, :show] do
    resources :friendship, :only => [:destroy] do
      collection do
        get 'notification' => 'friendships#index'
        post 'send_request' => 'friendships#create'
        patch 'accept_request' => 'friendships#update'
      end
    end
    resources :posts, only: [:index, :create] do
      resources :likes, only: [:create]
      resources :comments, only: [:create]
    end    
  end

  #get 'users/:user_id/notify', to: 'users#notification', as: :friend_request_notify
  #post 'friend', to: 'users#send_request', as: :send_friend_request
  #patch 'friend', to: 'users#accept_request', as: :accept_friend_request


  devise_scope :user do
    root to: "devise/sessions#new"    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
