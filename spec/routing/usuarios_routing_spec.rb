require "rails_helper"

RSpec.describe "rotas para usuarios" do
    it "rota /usuarios para controlador usuario#index" do
        expect(get("/usuarios")).to route_to("usuario#index")
    end
    context "listagem de usuarios" do
        it "rota /usuarios/listagem para controlador usuario#listagem" do
            expect(get("/usuarios/listagem")).to route_to("usuario#listagem")
        end
    end
    context "exibição individual de usuário" do
        it "rota /usuarios/1 para controlador usuario#exibir" do
            expect(get("/usuarios/1")).to route_to("usuario#exibir", id: "1")
        end
        it "rota /usuarios/0 não deve ser acessível" do
            expect(get("/usuarios/0")).not_to be_routable
        end
    end
    context "criação de usuário" do
        it "rota /usuarios/criacao para controlador usuario#criacao" do
            expect(get("/usuarios/criacao")).to route_to("usuario#criacao")
        end
    end
    context "edição de usuário" do
        it "rota /usuarios/editar/1 para controlador usuario#editar" do
            expect(get("/usuarios/editar/1")).to route_to("usuario#editar", id: "1")
        end
        it "rota /usuarios/editar/0 não deve ser acessível" do
            expect(get("/usuarios/editar/0")).not_to be_routable
        end
    end
    context "exclusão de usuário" do
        it "rota /usuarios/excluir/1 para controlador usuario#excluir" do
            expect(get("/usuarios/excluir/1")).to route_to("usuario#excluir", id: "1")
        end
        it "rota /usuarios/excluir/0 não deve ser acessível" do
            expect(get("/usuarios/excluir/0")).not_to be_routable
        end
    end
end
