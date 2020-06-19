Rails.application.routes.draw do
  get 'event_attendances/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout' 
  get '/event_attendances/new/:event', to: 'event_attendances#new'
   resources :users
  resources :sessions, only: [:new,:create,:destroy]
  resources :events do
    resource :event_attendances
  end
  root "events#index"
end
