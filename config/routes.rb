Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  root "events#index"
  resources :users
  resources :events do
    resources :event_attendees, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
