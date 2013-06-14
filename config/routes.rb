Todo::Application.routes.draw do
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

  get '/home' => 'users#index'
  resources :users, :only => [:new, :create]
  resources :projects, :only => [:new, :create]
  resources :teams, :except => :index do
    resources :projects do
      resources :items, :only => [:index, :show, :new] do
        post '/check' => 'items#check'
      end
    end
  end
end
