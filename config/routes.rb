Rails.application.routes.draw do
  namespace :admin do
    resources :admin_users
    resources :users
    resources :courses
    resources :sections
    resources :lessons
    resources :resources
    resources :attachments
    resources :subscriptions do
      member do
        patch 'cancel'
      end
    end

    root to: "courses#index"
  end
  devise_for :admin_users

  root to: 'home#index'

  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api, defaults: { format: :json } do
    resources :courses do
      resources :sections
      member do
        get 'classmates'
      end
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

      collection do
        get 'retrieve_card'
        put 'update_card'
        put 'resubcribe'
      end
    end

    namespace :c_labs do
      get '/verify', to: 'accounts#verify'
    end

    namespace :n_pilots do
      post '/create_task', to: 'tasks#create'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/*path', to: 'home#index', format: false
end
