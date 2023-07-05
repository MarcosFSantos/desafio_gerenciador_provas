require 'rails_helper'

RSpec.describe UsuariosController, type: :controller do
    context "Testes do controlador UsuarioController" do
        context "Teste da ação listar" do
            it "teste deve retornar status 200" do
                get :listar
                expect(response).to have_http_status(200)
            end
        end
        context "Teste da ação mostrar" do
            it "teste deve retornar status 200" do
                get :mostrar, params: { id: 1}
                expect(response).to have_http_status(200)
            end
        end
        context "Teste da ação criar" do
            it "teste deve retornar status 200" do
                post :criar
                expect(response).to have_http_status(200)
            end
        end
        context "Teste da ação atualizar" do
            it "teste deve retornar status 200" do
                put :atualizar, params: { id: 1}
                expect(response).to have_http_status(200)
            end
        end
        context "Teste da ação destruir" do
            it "teste deve retornar status 200" do
                delete :destruir, params: { id: 1}
                expect(response).to have_http_status(200)
            end
        end

    end
end
