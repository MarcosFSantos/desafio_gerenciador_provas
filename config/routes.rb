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
  get "/participantes/:id/provas/:prova_id", to: "participantes#mostrar_prova", constraints: { id: /[1-9]\d*/ , prova_id: /[1-9]\d*/ }
  get "/participantes/:id", to: "participantes#mostrar", constraints: { id: /[1-9]\d*/ }
  post "/participantes", to: "participantes#criar"
  put "/participantes/:id", to: "participantes#atualizar", constraints: { id: /[1-9]\d*/ }
  delete "/participantes/:id", to: "participantes#destruir", constraints: { id: /[1-9]\d*/ }
  # Rotas de Provas
  get "/provas", to: "provas#listar"
  get "/provas/:id/participantes", to: "provas#listar_participantes", constraints: { id: /[1-9]\d*/ }
  get "/provas/:id", to: "provas#mostrar", constraints: { id: /[1-9]\d*/ }
  post "/provas", to: "provas#criar"
  put "/provas/:id", to: "provas#atualizar", constraints: { id: /[1-9]\d*/ }
  delete "/provas/:id", to: "provas#destruir", constraints: { id: /[1-9]\d*/ }
  # Rotas de Questões de Provas
  get "/provas/:prova_id/questoes", to: "questoes#listar", constraints: { prova_id: /[1-9]\d*/ }
  get "/provas/:prova_id/questoes/:questao_id", to: "questoes#mostrar", constraints: { prova_id: /[1-9]\d*/ , questao_id: /[1-9]\d*/ }
  post "/provas/:prova_id/questoes", to: "questoes#criar", constraints: { prova_id: /[1-9]\d*/ }
  put "/provas/:prova_id/questoes/:questao_id", to: "questoes#atualizar", constraints: { prova_id: /[1-9]\d*/ , questao_id: /[1-9]\d*/ }
  delete "/provas/:prova_id/questoes/:questao_id", to: "questoes#destruir", constraints: { prova_id: /[1-9]\d*/ , questao_id: /[1-9]\d*/ }
  # Rotas de Escolhas
  get "/provas/:prova_id/questoes/:questao_id/escolhas", to: "escolhas#listar", constraints: { prova_id: /[1-9]\d*/ , questao_id: /[1-9]\d*/ }
  get "/provas/:prova_id/questoes/:questao_id/escolhas/:escolha_id", to: "escolhas#mostrar", constraints: { prova_id: /[1-9]\d*/ , questao_id: /[1-9]\d*/, escolha_id: /[1-9]\d*/ }
  post "/provas/:prova_id/questoes/:questao_id/escolhas", to: "escolhas#criar", constraints: { prova_id: /[1-9]\d*/ , questao_id: /[1-9]\d*/ }
  put "/provas/:prova_id/questoes/:questao_id/escolhas/:escolha_id", to: "escolhas#atualizar", constraints: { prova_id: /[1-9]\d*/ , questao_id: /[1-9]\d*/, escolha_id: /[1-9]\d*/ }
  delete "/provas/:prova_id/questoes/:questao_id/escolhas/:escolha_id", to: "escolhas#destruir", constraints: { prova_id: /[1-9]\d*/ , questao_id: /[1-9]\d*/, escolha_id: /[1-9]\d*/ }
  # Rotas de Respostas
  post "/participantes/:participante_id/provas/:prova_id/resposta", to: "respostas#criar", constraints: { participante_id: /[1-9]\d*/ ,prova_id: /[1-9]\d*/ }
  put "/participantes/:participante_id/provas/:prova_id/resposta", to: "respostas#atualizar", constraints: { participante_id: /[1-9]\d*/ ,prova_id: /[1-9]\d*/ }
end