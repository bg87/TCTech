Rails.application.routes.draw do

  devise_for :users

  # Nest comments routes
  resources :messages do
    resources :comments
  end
  
  root 'messages#index'

end
