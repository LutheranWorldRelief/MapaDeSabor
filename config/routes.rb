Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  mount Ckeditor::Engine => '/ckeditor'

  namespace :panel do
    root to: "dashboard#index"
    resources :countries
    resources :producers
    resources :pages
    resources :places
    resources :flavors do
      member do
        post "create_flavor_item"
        delete "destroy_flavor_item"
        put "change_status"
      end
    end
    resources :profile, only: [:edit, :update]
    resources :users
    resources :contacts, only: [:index, :show]
  end
  root to: "dashboard#new_index"

  resources :dashboard do
    collection do
      get "search"
    end
  end

  resources :products, only: [:show]

  get 'about_us', to: 'dashboard#about_us'
  get 'search', to: 'dashboard#search'
  get 'search_content', to: 'dashboard#search_content'

  resources :contacts, only: [:new, :create]

end
