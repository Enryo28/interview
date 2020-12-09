Rails.application.routes.draw do
  devise_for :users
  resources :rooms, only: [:new, :create, :show, :edit, :update, :destroy] do
    # collection do
    #   post :confirm
    #   get :confirm
    # end
  end
  root "rooms#index"
  get "myself" => "myself#index"
  get "practice" => "practice#index"
  get "only" => "only#index"
  # resources :users, only: [:create, :show, :edit, :update] do
    
  # end
  
  
  
end
