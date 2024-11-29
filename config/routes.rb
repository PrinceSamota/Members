Rails.application.routes.draw do
  resources :memberdownloads, only: [] do
    collection do
      get :download_csv  # Route for the CSV download
    end
  end
  resources :members
  devise_for :users 
  resource :welcome
  root to: 'members#index'
end
