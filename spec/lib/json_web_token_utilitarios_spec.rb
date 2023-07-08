require "rails_helper"
require "json_web_token_utilitarios.rb"

RSpec.describe JsonWebTokenUtilitarios do
    context "Testes de utilitarios do JWT" do
        context "Testes da codificação de dados no token" do
            it "o método .codificar deve retornar um token em formato string" do
                payload = { id_usuario: 1, nome_usuario: 'usuario' }
                token = JsonWebTokenUtilitarios.codificar(payload)
                expect(token).to be_a(String)
            end
            it "o método .codificar deve retornar um token formado por três partes separadas por ponto('.')" do
                payload = { id_usuario: 1, nome_usuario: 'usuario' }
                token = JsonWebTokenUtilitarios.codificar(payload)
                partes = token.split(".")
                expect(partes.length()).to eq(3)
            end
            it "o método .codificar deve retornar nil para informações inválidas" do
                payload_invalido = "1234"
                resposta = JsonWebTokenUtilitarios.codificar(payload_invalido)
                expect(resposta).to eq(nil)
            end
        end
        context "Testes da decodificação de dados no token" do
            it "o método .decodificar deve retornar o payload decodificado como um objeto HashWithIndifferentAccess" do
                payload = { id_usuario: 1, nome_usuario: 'usuario' }
                token = JsonWebTokenUtilitarios.codificar(payload)
                payload_decodificado = JsonWebTokenUtilitarios.decodificar(token)
                expect(payload_decodificado).to be_a(HashWithIndifferentAccess)
            end
            it "o método .decodificar deve retornar um payload com as informações passadas ao token" do
                payload = { id_usuario: 1, nome_usuario: 'usuario' }
                token = JsonWebTokenUtilitarios.codificar(payload)
                payload_decodificado = JsonWebTokenUtilitarios.decodificar(token)
                expect(payload_decodificado[:id_usuario]).to eq(payload[:id_usuario])
                expect(payload_decodificado[:nome_usuario]).to eq(payload[:nome_usuario])
            end
            it "o método .decodificar deve retornar nulo para tokens inválidos" do
                token_invalido = "1234"
                resposta = JsonWebTokenUtilitarios.decodificar(token_invalido)
                expect(resposta).to eq(nil)
            end
        end
    end
end
