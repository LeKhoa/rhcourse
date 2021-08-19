Rails.application.routes.draw do
  namespace :admin do
    resources :admin_users
    resources :users
    resources :courses
    resources :sections
    resources :lessons
    resources :resources
    resources :attachments

    root to: "courses#index"
  end
  devise_for :admin_users

  root to: 'home#index'

  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :courses do
    resources :sections
  end

  resources :sections do
    resources :lessons do
      member do
        post 'watched'
      end
    end
    resources :resources
    resources :notes
  end

  resources :users do
    member do
      put 'set_password'
      put 'change_password'
    end
  end

  namespace :c_labs do
    get '/verify', to: 'accounts#verify'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
