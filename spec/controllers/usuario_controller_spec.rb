require 'rails_helper'

# Classe controlador de usuário falsa, contrída apenas para fins de testes.
class UsuarioController < ApplicationController
    def login
    end
  end

RSpec.describe UsuarioController, type: :controller do
    context "Testes do controlador UsuarioController" do
        context "Teste da ação index" do
            it "teste deve retornar status 200" do
                get :index
                expect(response).to have_http_status(200)
            end
        end
        context "Teste da ação show" do
            it "teste deve retornar status 200" do
                get :show, params: { id: 1}
                expect(response).to have_http_status(200)
            end
        end
        context "Teste da ação create" do
            it "teste deve retornar status 200" do
                post :create
                expect(response).to have_http_status(200)
            end
        end
        context "Teste da ação update" do
            it "teste deve retornar status 200" do
                put :update, params: { id: 1}
                expect(response).to have_http_status(200)
            end
        end
        context "Teste da ação delete" do
            it "teste deve retornar status 200" do
                delete :destroy, params: { id: 1}
                expect(response).to have_http_status(200)
            end
        end

    end
end
