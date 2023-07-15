require "rails_helper"

RSpec.describe "Testes de rotas para participantes" do
    context "Testes de rotas de listagem de participantes" do
        it "rota GET /participantes para controlador participantes#listar" do
            expect(get "/participantes").to route_to("participantes#listar")
        end
    end
    context "Testes de rotas de listagem de provas de participante" do
        it "rota GET /participantes/1/provas para controlador participantes#listar_provas" do
            expect(get "/participantes/1/provas").to route_to("participantes#listar_provas", id: "1")
        end
        it "rota GET /participantes/0/provas deve não deve ser acessível" do
            expect(get "/participantes/0/provas").not_to be_routable
        end
    end
    context "Testes de rotas de exibição individual de provas de participante" do
        it "rota POST /participantes/1/provas/1 para controlador participantes#inscrever_prova" do
            expect(post "/participantes/1/provas/1").to route_to("participantes#inscrever_prova", id: "1", prova_id: "1")
        end
        it "rota POST /participantes/0/provas/1 deve não deve ser acessível" do
            expect(post "/participantes/0/provas/1").not_to be_routable
        end
        it "rota POST /participantes/1/provas/0 deve não deve ser acessível" do
            expect(post "/participantes/1/provas/0").not_to be_routable
        end
    end
    context "Testes de rotas de exibição individual de provas de participante" do
        it "rota GET /participantes/1/provas/1 para controlador participantes#mostrar_prova" do
            expect(get "/participantes/1/provas/1").to route_to("participantes#mostrar_prova", id: "1", prova_id: "1")
        end
        it "rota GET /participantes/0/provas/1 deve não deve ser acessível" do
            expect(get "/participantes/0/provas/1").not_to be_routable
        end
        it "rota GET /participantes/1/provas/0 deve não deve ser acessível" do
            expect(get "/participantes/1/provas/0").not_to be_routable
        end
    end
    context "Testes de rotas de exibição individual de participante" do
        it "rota GET /participantes/1 para controlador participantes#mostrar" do
            expect(get "/participantes/1").to route_to("participantes#mostrar", id: "1")
        end
        it "rota GET /participantes/0 deve não deve ser acessível" do
            expect(get "/participantes/0").not_to be_routable
        end
    end
    context "Testes de rotas de criação de participante" do
        it "rota POST /participantes para controlador participantes#criar" do
            expect(post "/participantes").to route_to("participantes#criar")
        end
    end
    context "Testes de rotas de edição de participante" do
        it "rota PUT /participantes/1 para controlador participantes#atualizar" do
            expect(put "/participantes/1").to route_to("participantes#atualizar", id: "1")
        end
        it "rota PUT /participantes/0 deve não deve ser acessível" do
            expect(put "/participantes/0").not_to be_routable
        end
    end
    context "Testes de rotas de exclusão de participante" do
        it "rota DELETE /participantes/1 para controlador participantes#destruir" do
            expect(delete "/participantes/1").to route_to("participantes#destruir", id: "1")
        end
        it "rota DELETE /participantes/0 deve não deve ser acessível" do
            expect(delete "/participantes/0").not_to be_routable
        end
    end
end
