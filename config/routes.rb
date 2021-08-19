Rails.application.routes.draw do
  root 'graduados#busqueda'

  resources :graduados do
      get 'busqueda', on: :collection
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
