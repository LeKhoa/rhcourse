Rails.application.routes.draw do

  get 'sections/index'
  get 'resources/index'
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
    resources :sections do
      resources :lessons do
        collection do
          post 'watched'
        end
        resources :notes
      end
      resources :resources
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
