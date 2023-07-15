require "rails_helper"

RSpec.describe "Testes de rotas para respostas" do
    context "Testes de rotas de criação de respostas das provas" do
        it "rota POST /participantes/1/provas/1/resposta para controlador respostas#criar" do
            expect(post "/participantes/1/provas/1/resposta").to route_to("respostas#criar", participante_id: "1", prova_id: "1")
        end
        it "rota POST /participantes/1/provas/0/resposta deve não deve ser acessível" do
            expect(post "/participantes/1/provas/0/resposta").not_to be_routable
        end
        it "rota POST /participantes/0/provas/1/resposta deve não deve ser acessível" do
            expect(post "/participantes/0/provas/1/resposta").not_to be_routable
        end
    end
    context "Testes de rotas de edição de respostas das provas" do
        it "rota PUT /participantes/1/provas/1/resposta para controlador respostas#atualizar" do
            expect(put "/participantes/1/provas/1/resposta").to route_to("respostas#atualizar", participante_id: "1", prova_id: "1")
        end
        it "rota PUT /participantes/1/provas/0/resposta deve não deve ser acessível" do
            expect(put "/participantes/1/provas/0/resposta").not_to be_routable
        end
        it "rota PUT /participantes/0/provas/1/resposta deve não deve ser acessível" do
            expect(put "/participantes/0/provas/1/resposta").not_to be_routable
        end
    end
end