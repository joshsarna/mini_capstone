Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    delete '/products/:id' => 'products#destroy'
    patch '/products/:id' => 'products#update'
    post '/pictures' => 'pictures#create'

    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'

    get '/orders' => 'orders#index'
    get '/orders/:id' => 'orders#show'
    post '/orders' => 'orders#create'
    get '/carted_products' => 'carted_products#index'
    get '/carted_products/:id' => 'carted_products#show'
    post '/carted_products' => 'carted_products#create'
    delete '/carted_products' => 'carted_products#destroy'
  end
end
