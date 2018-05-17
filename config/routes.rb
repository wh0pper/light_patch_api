Rails.application.routes.draw do
  resources :states #, only: [:index, :update]

  get 'active_state', to: 'states#active_state', as: :active_state
  get 'test_blink', to: 'states#test_blink', as: :test_blink
  get 'show_color', to: 'states#show_color', as: :show_color
end
