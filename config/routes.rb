Rails.application.routes.draw do

  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  root :to => 'pages#home'
  get '/home' => 'pages#home'
  get '/home/food' => 'pages#food'
  get '/home/animal' => 'pages#animal'
  get 'home/travel' => 'pages#travel'
  get 'home/decor'=> 'pages#decor'
  get 'home/plant' => 'pages#plant'
  get 'home/other' => 'pages#other'

  resources :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :posts, :only => [:new, :show, :create, :edit, :update, :index, :destroy]

  resources :posts do
    resources :comments
  end

  post ':user_id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user


end
