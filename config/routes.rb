Rails.application.routes.draw do

  
    mount Ckeditor::Engine => '/ckeditor'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users, controllers: {
    	sessions: 'users/sessions'
    }

    root 'home#index'

	get 'home', to: 'home#index'

    resources :abouts, only: [:index]
    resources :posts, only: [:index, :show, :delete]
    resources :contacts, only: [:index, :new, :create]
    resources :albums, only: [:index, :show, :create]
end

