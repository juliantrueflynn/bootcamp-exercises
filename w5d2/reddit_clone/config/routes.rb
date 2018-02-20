Rails.application.routes.draw do
  resources :users, only: [:show, :create, :new, :index]
  resource :session
  resources :subs, except: :destroy
  resources :posts, except: :index do
    resources :comments, only: :new
  end
  resources :comments, only: [:show, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
