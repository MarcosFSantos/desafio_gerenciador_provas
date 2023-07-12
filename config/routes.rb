Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Rotas de Usuarios
  get "/usuarios", to: "usuarios#listar"
  post "/usuarios", to: "usuarios#criar"
  get "/usuarios/:matricula", to: "usuarios#mostrar"
  get "/usuarios/:matricula/participantes", to: "usuarios#listar_participantes"
  put "/usuarios/:matricula", to: "usuarios#atualizar"
  delete "/usuarios/:matricula", to: "usuarios#destruir"
  post "/autenticacao/login", to: "autenticacao#login"
  # Rotas de Participantes
  get "/participantes", to: "participantes#listar"
  get "/participantes/:id/provas", to: "participantes#listar_provas", constraints: { id: /[1-9]\d*/ }
  get "/participantes/:id", to: "participantes#mostrar", constraints: { id: /[1-9]\d*/ }
  post "/participantes", to: "participantes#criar"
  put "/participantes/:id", to: "participantes#atualizar", constraints: { id: /[1-9]\d*/ }
  delete "/participantes/:id", to: "participantes#destruir", constraints: { id: /[1-9]\d*/ }
  # Rotas de Provas
  get "/provas", to: "provas#listar"
  get "/provas/:id/provas", to: "provas#listar_participantes", constraints: { id: /[1-9]\d*/ }
  get "/provas/:id", to: "provas#mostrar", constraints: { id: /[1-9]\d*/ }
  post "/provas", to: "provas#criar"
  put "/provas/:id", to: "provas#atualizar", constraints: { id: /[1-9]\d*/ }
  delete "/provas/:id", to: "provas#destruir", constraints: { id: /[1-9]\d*/ }
end