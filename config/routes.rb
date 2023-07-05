Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/usuarios", to: "usuarios#index"
  post "/usuarios", to: "usuarios#create"
  get "/usuarios/:id", to: "usuarios#show", constraints: { id: /[1-9]\d*/ }
  put "/usuarios/:id", to: "usuarios#update", constraints: { id: /[1-9]\d*/ }
  delete "/usuarios/:id", to: "usuarios#destroy", constraints: { id: /[1-9]\d*/ }
  post "/autenticacao/login", to: "autenticacao#login"
end