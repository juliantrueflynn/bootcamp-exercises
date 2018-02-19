Rails.application.routes.draw do
  resources :users, only: [:show, :create, :new, :index]
  resource :session
  resources :subs, except: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
