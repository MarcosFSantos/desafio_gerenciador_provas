require "rails_helper"

RSpec.describe "Testes de rotas para provas" do
    context "Testes de rotas de listagem de provas" do
        it "rota GET /provas para controlador provas#listar" do
            expect(get "/provas").to route_to("provas#listar")
        end
    end
    context "Testes de rotas de listagem de participantes de provas" do
        it "rota GET /provas/1/participantes para controlador provas#listar_participantes" do
            expect(get "/provas/1/participantes").to route_to("provas#listar_participantes", id: "1")
        end
        it "rota GET /provas/0/participantes deve não deve ser acessível" do
            expect(get "/provas/0/participantes").not_to be_routable
        end
    end
    context "Testes de rotas de listagem de notas de participantes de provas" do
        it "rota GET /provas/1/participantes/ranking para controlador provas#ranking_notas" do
            expect(get "/provas/1/participantes/ranking").to route_to("provas#ranking_notas", id: "1")
        end
        it "rota GET /provas/1/participantes/ranking deve não deve ser acessível" do
            expect(get "/provas/0/participantes/ranking").not_to be_routable
        end
    end
    context "Testes de rotas de exibição individual de provas" do
        it "rota GET /provas/1 para controlador provas#mostrar" do
            expect(get "/provas/1").to route_to("provas#mostrar", id: "1")
        end
        it "rota GET /provas/0 deve não deve ser acessível" do
            expect(get "/provas/0").not_to be_routable
        end
    end
    context "Testes de rotas de criação de provas" do
        it "rota POST /provas para controlador provas#criar" do
            expect(post "/provas").to route_to("provas#criar")
        end
    end
    context "Testes de rotas de edição de participante" do
        it "rota PUT /provas/1 para controlador provas#atualizar" do
            expect(put "/provas/1").to route_to("provas#atualizar", id: "1")
        end
        it "rota PUT /provas/0 deve não deve ser acessível" do
            expect(put "/provas/0").not_to be_routable
        end
    end
    context "Testes de rotas de exclusão de provas" do
        it "rota DELETE /provas/1 para controlador provas#destruir" do
            expect(delete "/provas/1").to route_to("provas#destruir", id: "1")
        end
        it "rota DELETE /provas/0 deve não deve ser acessível" do
            expect(delete "/provas/0").not_to be_routable
        end
    end
end
