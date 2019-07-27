Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, skip: :root

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

  devise_scope :user do
    root to: "devise/sessions#new"    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
