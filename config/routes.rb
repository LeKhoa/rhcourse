Rails.application.routes.draw do

  namespace :admin do
    resources :admin_users
    resources :users
    resources :lessons
    resources :courses

    root to: "courses#index"
  end
  devise_for :admin_users

  root to: 'home#index'

  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :courses do
    collection do
      get 'my_course'
    end

    resources :lessons do
      collection do
        post 'watched'
      end
      resources :notes
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
