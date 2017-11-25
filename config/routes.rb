Rails.application.routes.draw do

  root :to => 'pages#home'
  get '/home' => 'pages#home'

  resources :users, :only => [:new, :index, :create, :edit, :update, :show]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :posts, :only => [:new, :show, :create, :edit, :update, :index]


end
