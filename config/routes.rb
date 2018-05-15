Rails.application.routes.draw do
  resources :states, only: [:index, :update]

  get 'active_state', to: 'states#active_state', as: :active_state
  get 'test_blink', to: 'states#test_blink', as: :test_blink
  get 'test_show', to: 'states#test_show', as: :test_show
end
