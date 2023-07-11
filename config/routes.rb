Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/usuarios", to: "usuarios#listar"
  post "/usuarios", to: "usuarios#criar"
  get "/usuarios/:matricula", to: "usuarios#mostrar"
  put "/usuarios/:matricula", to: "usuarios#atualizar"
  delete "/usuarios/:matricula", to: "usuarios#destruir"
  post "/autenticacao/login", to: "autenticacao#login"
  get "/participantes", to: "participantes#listar"
  get "/participantes/:id", to: "participantes#mostrar", constraints: { id: /[1-9]\d*/ }
  post "/participantes", to: "participantes#criar"
  put "/participantes/:id", to: "partipantes#atualizar", constraints: { id: /[1-9]\d*/ }
  delete "/participantes/:id", to: "participantes#destruir", constraints: { id: /[1-9]\d*/ }
end