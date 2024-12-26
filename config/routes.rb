Rails.application.routes.draw do
  
  resources :memberdownloads, only: [] do
    collection do
      get :download_csv  # Route for the CSV download
    end
  end
  resources :members do
    resources :familymembers, only: [:new, :create, :index] do
    collection do
      get :all, to: 'familymembers#all' 
    end
  end
  end
  devise_for :users 
  resource :welcome
  root to: 'members#index'
end
