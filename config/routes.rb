Rails.application.routes.draw do
  get 'event_attendances/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout' 
   resources :users
  resources :sessions, only: [:new,:create,:destroy]
  resources :events do
    resource :event_attendance
  end
  root "events#index"
end
