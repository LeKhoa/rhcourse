Rails.application.routes.draw do

  root to: 'home#index'
  get 'onboard', to: 'home#onboard', as: :onboard

  devise_for :users do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
