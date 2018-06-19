Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'creatures#index'
  resources :creatures do
    collection do
      get 'search', to: "creatures#search", :as => 'search'
    end
  end

  resources :bookings, only: [:index, :create, :update, :destroy]
end
