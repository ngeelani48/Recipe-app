Rails.application.routes.draw do
  resources :recipes
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do 
    authenticated :user do 
      root 'users#index', as: :authenticated_root 
    end
    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root 
    end 
  end

  # Defines the root path route ("/")
  root "users#index"
end
