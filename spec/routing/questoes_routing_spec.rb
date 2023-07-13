require "rails_helper"

RSpec.describe "Testes de rotas para questões das provas" do
    context "Testes de rotas de listagem de questões das provas" do
        it "rota GET /provas/1/questoes para controlador questoes#listar" do
            expect(get "/provas/1/questoes").to route_to("questoes#listar", prova_id: "1")
        end
    end
    context "Testes de rotas de exibição individual de questões das provas" do
        it "rota GET /provas/1/questoes/1 para controlador questoes#mostrar" do
            expect(get "/provas/1/questoes/1").to route_to("questoes#mostrar", prova_id: "1", questao_id: "1")
        end
        it "rota GET /provas/1/questoes/0 deve não deve ser acessível" do
            expect(get "/provas/1/questoes/0").not_to be_routable
        end
        it "rota GET /provas/0/questoes/1 deve não deve ser acessível" do
            expect(get "/provas/0/questoes/1").not_to be_routable
        end
    end
    context "Testes de rotas de criação de questões das provas" do
        it "rota POST /provas/1/questoes para controlador questoes#criar" do
            expect(post "/provas/1/questoes").to route_to("questoes#criar", prova_id: "1")
        end
    end
    context "Testes de rotas de edição de questões das provas" do
        it "rota PUT /provas/1/questoes/1 para controlador questoes#atualizar" do
            expect(put "/provas/1/questoes/1").to route_to("questoes#atualizar", prova_id: "1", questao_id: "1")
        end
        it "rota PUT /provas/0/questoes/1 deve não deve ser acessível" do
            expect(put "/provas/0/questoes/1").not_to be_routable
        end
        it "rota PUT /provas/1/questoes/0 deve não deve ser acessível" do
            expect(put "/provas/1/questoes/0").not_to be_routable
        end
    end
    context "Testes de rotas de exclusão de questões das provas" do
        it "rota DELETE /provas/1/questoes/1 para controlador questoes#destruir" do
            expect(delete "/provas/1/questoes/1").to route_to("questoes#destruir", prova_id: "1", questao_id: "1")
        end
        it "rota DELETE /provas/0/questoes/1 deve não deve ser acessível" do
            expect(delete "/provas/0/questoes/1").not_to be_routable
        end
        it "rota DELETE /provas/1/questoes/0 deve não deve ser acessível" do
            expect(delete "/provas/1/questoes/0").not_to be_routable
        end
    end
end