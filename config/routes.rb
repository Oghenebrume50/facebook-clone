Rails.application.routes.draw do
  devise_for :users, skip: :root

  resources :users, only: [:index, :show] do
    get 'notify', to: 'friendings#notification', as: :friend_request_notify
    post 'friend', to: 'friendings#send_friend_request', as: :send_friend_request
    patch 'friend', to: 'friendings#accept_friend_request', as: :accept_friend_request
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
