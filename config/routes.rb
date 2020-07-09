Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    resources :cars, only: [:index, :show, :create, :update, :destroy]
    resources :persons, only: [:index, :create, :show, :update, :destroy]
  end


end
