require 'rails_helper'

# Classe controlador de autenticação falsa, contrída apenas para fins de testes.
class AutenticacaoController < ApplicationController
    def login
      # Implementação do método de login
    end
  end

RSpec.describe AutenticacaoController, type: :controller do
    context "Testes do controlador AutenticacaoController" do
        context "Teste da ação login" do
            it "teste deve retornar status 200" do
                post :login
                expect(response).to have_http_status(200)
            end
        end
    end
end
