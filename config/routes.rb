Rails.application.routes.draw do
  devise_for :users

  resources :recipes, only: [:index, :show, :create, :edit, :new, :destroy, :update] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  get 'shopping_lists', to: 'shopping_lists#index', as: 'shopping_lists'

  resources :public_recipes, only: [:index]
  
  resources :recipe_foods, only: [:index, :edit, :update, :destroy, :create, :new]
  
  resources :foods, only: [:index, :create, :new, :edit, :destroy]
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
