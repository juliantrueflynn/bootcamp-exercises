Rails.application.routes.draw do
  get 'tracks/new'

  get 'tracks/create'

  get 'tracks/edit'

  get 'tracks/show'

  get 'tracks/update'

  get 'tracks/destroy'

  resources :users
  resource :session
  resources :bands do
    resources :albums, only: :new
  end

  resources :albums, only: [:edit, :update, :destroy, :create, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
