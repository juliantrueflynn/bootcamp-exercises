Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  resource :session
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
