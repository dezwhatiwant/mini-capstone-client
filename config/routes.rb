Rails.application.routes.draw do
  get '/' => 'client/products#index'

  get "/signup" => "users#new"
  post "/users" => "users#create"
  
  namespace :client do
    get '/products' => 'products#index'
    get 'products/new' => 'products#new'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'
    get '/products/:id/edit' => 'products#edit'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'
  end
end
