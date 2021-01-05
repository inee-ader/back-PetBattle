Rails.application.routes.draw do
  resources :pet_teams, only:[:index, :show, :create]
  resources :bosses, only:[:index, :create, :update]
  resources :games, only:[:index, :show, :create]
  resources :pets, only:[:index, :create, :update]
  resources :teams, only:[:index, :create]
  resources :users

  get "/api", to: "pets#api"

  post "/login", to: "users#login"
  post "/newgame", to: "users#newgame"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
