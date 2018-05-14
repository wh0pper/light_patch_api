Rails.application.routes.draw do
  resources :states, only: [:index]

  get 'active_state', to: 'states#active_state', as: :active_state
end
