Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/usuarios", to: "usuarios#listar"
  post "/usuarios", to: "usuarios#criar"
  get "/usuarios/:id", to: "usuarios#mostrar", constraints: { id: /[1-9]\d*/ }
  put "/usuarios/:id", to: "usuarios#atualizar", constraints: { id: /[1-9]\d*/ }
  delete "/usuarios/:id", to: "usuarios#destruir", constraints: { id: /[1-9]\d*/ }
  post "/autenticacao/login", to: "autenticacao#login"
end