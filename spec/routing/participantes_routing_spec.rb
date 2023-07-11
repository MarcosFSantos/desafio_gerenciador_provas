require "rails_helper"

RSpec.describe "Testes de rotas para participantes" do
    context "Testes de rotas de listagem de participantes" do
        it "rota GET /participantes para controlador participantes#listar" do
            expect(get "/participantes").to route_to("participantes#listar")
        end
    end
    context "Testes de rotas de exibição individual de participante" do
        it "rota GET /participantes/1 para controlador participantes#mostrar" do
            expect(get "/participantes/1").to route_to("participantes#mostrar", id: "1")
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
    end
    context "Testes de rotas de exclusão de participante" do
        it "rota DELETE /participantes/1 para controlador participantes#destruir" do
            expect(delete "/participantes/1").to route_to("participantes#destruir", id: "1")
        end
    end
end
