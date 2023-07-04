require "rails_helper"

RSpec.describe "Testes de rotas para usuarios" do
    context "Testes de rotas de login de usuário" do
        it "rota POST /autenticacao/login para controlador autenticacao#login" do
            expect(post "/autenticacao/login").to route_to("autenticacao#login")
        end
    end
    context "Testes de rotas de listagem de usuarios" do
        it "rota GET /usuarios para controlador usuario#index" do
            expect(get "/usuarios").to route_to("usuario#index")
        end
    end
    context "Testes de rotas de exibição individual de usuário" do
        it "rota GET /usuarios/1 para controlador usuario#show" do
            expect(get "/usuarios/1").to route_to("usuario#show", id: "1")
        end
        it "rota GET /usuarios/0 não deve ser acessível" do
            expect(get "/usuarios/0").not_to be_routable
        end
    end
    context "Testes de rotas de criação de usuário" do
        it "rota POST /usuarios para controlador usuario#create" do
            expect(post "/usuarios").to route_to("usuario#create")
        end
    end
    context "Testes de rotas de edição de usuário" do
        it "rota PUT /usuarios/1 para controlador usuario#edit" do
            expect(put "/usuarios/1").to route_to("usuario#update", id: "1")
        end
        it "rota PUT /usuarios/0 não deve ser acessível" do
            expect(put "/usuarios/0").not_to be_routable
        end
    end
    context "Testes de rotas de exclusão de usuário" do
        it "rota DELETE /usuarios/1 para controlador usuario#destroy" do
            expect(delete "/usuarios/1").to route_to("usuario#destroy", id: "1")
        end
        it "rota DELETE /usuarios/0 não deve ser acessível" do
            expect(delete "/usuarios/0").not_to be_routable
        end
    end
end
