Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/products" => "products#products_method"
  get "/unicorn_tears" => "products#unicorn_tears_method"
end
