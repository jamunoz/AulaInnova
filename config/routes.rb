Rails.application.routes.draw do

  
    mount Ckeditor::Engine => '/ckeditor'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users, controllers: {
    	sessions: 'users/sessions'
    }

    root 'home#index'

	get 'home', to: 'home#index'

    resources :abouts, only: [:index]
    resources :posts, only: [:index, :show, :destroy]
    resources :contacts, only: [:index, :create]
    resources :albums, only: [:index, :destroy]
    
end

