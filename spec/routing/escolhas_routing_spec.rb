require "rails_helper"

RSpec.describe "Testes de rotas para escolhas" do
    context "Testes de rotas de listagem de escolhas de questões das provas" do
        it "rota GET /provas/1/questoes/1/escolhas para controlador escolhas#listar" do
            expect(get "/provas/1/questoes/1/escolhas").to route_to("escolhas#listar", prova_id: "1", questao_id: "1")
        end
        it "rota GET /provas/1/questoes/0/escolhas deve não deve ser acessível" do
            expect(get "/provas/1/questoes/0/escolhas").not_to be_routable
        end
        it "rota GET /provas/0/questoes/1/escolhas deve não deve ser acessível" do
            expect(get "/provas/0/questoes/1/escolhas").not_to be_routable
        end
    end
    context "Testes de rotas de exibição individual de escolhas de questões das provas" do
        it "rota GET /provas/1/questoes/1/escolhas/1 para controlador escolhas#mostrar" do
            expect(get "/provas/1/questoes/1/escolhas/1").to route_to("escolhas#mostrar", prova_id: "1", questao_id: "1", escolha_id: "1")
        end
        it "rota GET /provas/1/questoes/1/escolhas/0 deve não deve ser acessível" do
            expect(get "/provas/1/questoes/1/escolhas/0").not_to be_routable
        end
        it "rota GET /provas/1/questoes/0/escolhas/1 deve não deve ser acessível" do
            expect(get "/provas/1/questoes/0/escolhas/1").not_to be_routable
        end
        it "rota GET /provas/0/questoes/1/escolhas/1 deve não deve ser acessível" do
            expect(get "/provas/0/questoes/1/escolhas/1").not_to be_routable
        end
    end
    context "Testes de rotas de criação de escolhas de questões das provas" do
        it "rota POST /provas/1/questoes/1/escolhas para controlador escolhas#criar" do
            expect(post "/provas/1/questoes/1/escolhas").to route_to("escolhas#criar", prova_id: "1", questao_id: "1")
        end
        it "rota POST /provas/1/questoes/0/escolhas deve não deve ser acessível" do
            expect(post "/provas/1/questoes/0/escolhas").not_to be_routable
        end
        it "rota POST /provas/0/questoes/1/escolhas deve não deve ser acessível" do
            expect(post "/provas/0/questoes/1/escolhas").not_to be_routable
        end
    end
    context "Testes de rotas de edição de escolhas de questões das provas" do
        it "rota PUT /provas/1/questoes/1/escolhas/1 para controlador escolhas#atualizar" do
            expect(put "/provas/1/questoes/1/escolhas/1").to route_to("escolhas#atualizar", prova_id: "1", questao_id: "1", escolha_id: "1")
        end
        it "rota PUT /provas/1/questoes/1/escolhas/0 deve não deve ser acessível" do
            expect(put "/provas/1/questoes/1/escolhas/0").not_to be_routable
        end
        it "rota PUT /provas/1/questoes/0/escolhas/1 deve não deve ser acessível" do
            expect(put "/provas/1/questoes/0/escolhas/1").not_to be_routable
        end
        it "rota PUT /provas/0/questoes/1/escolhas/1 deve não deve ser acessível" do
            expect(put "/provas/0/questoes/1/escolhas/1").not_to be_routable
        end
    end
    context "Testes de rotas de exclusão de escolhas de questões das provas" do
        it "rota DELETE /provas/1/questoes/1/escolhas/1 para controlador escolhas#destruir" do
            expect(delete "/provas/1/questoes/1/escolhas/1").to route_to("escolhas#destruir", prova_id: "1", questao_id: "1", escolha_id: "1")
        end
        it "rota DELETE /provas/1/questoes/1/escolhas/0 deve não deve ser acessível" do
            expect(delete "/provas/1/questoes/1/escolhas/0").not_to be_routable
        end
        it "rota DELETE /provas/1/questoes/0/escolhas/1 deve não deve ser acessível" do
            expect(delete "/provas/1/questoes/0/escolhas/1").not_to be_routable
        end
        it "rota DELETE /provas/0/questoes/1/escolhas/1 deve não deve ser acessível" do
            expect(delete "/provas/0/questoes/1/escolhas/1").not_to be_routable
        end
    end
end