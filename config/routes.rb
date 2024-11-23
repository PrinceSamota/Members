Rails.application.routes.draw do
  resources :members
  devise_for :users 
  resource :welcome
  root to: 'members#index'
end
