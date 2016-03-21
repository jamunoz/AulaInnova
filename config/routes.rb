Rails.application.routes.draw do

    devise_for :users, controllers: {
    	sessions: 'users/sessions'
    }

  	root 'pages#home'

	  get 'pages/home', to: 'pages#home'
  	get 'pages/about' => 'pages#about'
  	get 'pages/robotics_workshop' => 'pages#robotics_workshop'
  	get 'pages/blog' => 'pages#blog'
  	get 'pages/picture_gallery' => 'pages#picture_gallery'
  	get 'pages/contact' => 'pages#contact'

  	resources :abouts, except: [:new, :destroy]
end

