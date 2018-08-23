Rails.application.routes.draw do
  resources :states #, only: [:index, :update]

  get 'active_state', to: 'states#active_state', as: :active_state
  get 'test_blink', to: 'states#test_blink', as: :test_blink
  get 'test_pink', to: 'states#test_pink', as: :test_pink
  patch 'send_values', to: 'states#send_values', as: :send_values
end
