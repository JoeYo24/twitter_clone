Rails.application.routes.draw do
  root 'homepage#index'
  get '/feeds' => 'feeds#index'
  #Sessions
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
  get '/authenticated' => 'sessions#authenticated'
  #Users
  post '/users' => 'users#create'
  #Tweets
  post '/tweets' => 'tweets#create'
  delete '/tweets/:id' => 'tweets#destroy'
  get '/tweets' => 'tweets#index'
  get 'users/:username/tweets' => 'tweets#index_by_user'

  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path' => 'homepage#index'
end
