Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  get 'events/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "events#index"
end
