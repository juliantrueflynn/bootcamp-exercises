Rails.application.routes.draw do
  resources :users
  resources :links do
    resources :comments, except: :destroy
  end
  resources :comments, only: [:destroy]
  resource :session, only: [:new, :create, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
