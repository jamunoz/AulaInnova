Rails.application.routes.draw do

  root 'pages#home'

  get 'about'  => 'pages#about'
  get 'robotics_workshop'  => 'pages#robotics_workshop'
  get 'blog'  => 'pages#blog'
  get 'picture_gallery'  => 'pages#picture_gallery'
  get 'contact'  => 'pages#contact'
  get 'login'  => 'pages#login'

  resources :abouts, except: [:new, :destroy]

end

