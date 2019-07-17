Rails.application.routes.draw do
  # get 'posts/index' 
  devise_for :users, skip: :root
  resources :posts
  resources :likes
  resources :comments

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
