Rails.application.routes.draw do
  resources :public_letters, only: [:index, :show]
  resources :private_letters, only: [:index, :show, :create,:destroy]
  resources :users, only: [:index, :show, :create, :destroy, :update]

end
