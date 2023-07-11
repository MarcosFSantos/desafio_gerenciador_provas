require "rails_helper"

RSpec.describe "Testes de rotas para usuarios" do
    context "Testes de rotas de login de usuário" do
        it "rota POST /autenticacao/login para controlador autenticacao#login" do
            expect(post "/autenticacao/login").to route_to("autenticacao#login")
        end
    end
    context "Testes de rotas de listagem de usuarios" do
        it "rota GET /usuarios para controlador usuarios#listar" do
            expect(get "/usuarios").to route_to("usuarios#listar")
        end
    end
    context "Testes de rotas de exibição individual de usuário" do
        it "rota GET /usuarios/1 para controlador usuario#mostrar" do
            expect(get "/usuarios/1").to route_to("usuarios#mostrar", matricula: "1")
        end
    end
    context "Testes de rotas de listagem de participantes do usuário" do
        it "rota GET /usuarios/1/participantes para controlador usuarios#listar_participantes" do
            expect(get "/usuarios/1/participantes").to route_to("usuarios#listar_participantes", matricula: "1")
        end
    end
    context "Testes de rotas de criação de usuário" do
        it "rota POST /usuarios para controlador usuario#criar" do
            expect(post "/usuarios").to route_to("usuarios#criar")
        end
    end
    context "Testes de rotas de edição de usuário" do
        it "rota PUT /usuarios/1 para controlador usuario#atualizar" do
            expect(put "/usuarios/1").to route_to("usuarios#atualizar", matricula: "1")
        end
    end
    context "Testes de rotas de exclusão de usuário" do
        it "rota DELETE /usuarios/1 para controlador usuario#destruir" do
            expect(delete "/usuarios/1").to route_to("usuarios#destruir", matricula: "1")
        end
    end
end
