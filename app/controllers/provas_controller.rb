class ProvasController < ApplicationController
    before_action :autorizar_requisicao
    before_action :encontrar_prova, except: %i[criar listar]

    # Método de listgem de usuários
    def listar
        @provas = Prova.all
        render json: @provas, status: :ok
    end

    # Método de exibição de um usuário
    def mostrar
        render json: @prova, status: :ok
    end

    # Mostrar os participantes
    def listar_participantes
        render json: @prova.participantes, status: :ok
    end
    
    # Método de criação de um usuário
    def criar
        @prova = Prova.new(parametros_prova)
        if @prova.save
            render json: @prova, status: :ok
        else
            render json: { errors: @prova.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    # Método de edição de um usuário
    def atualizar
        unless @prova.update(parametros_prova)
            render json: { erros: @prova.errors.full_messages }, status: :ok
        end
    end
    
    # Método de exclusão de um usuário
    def destruir
        @prova.destroy
    end

    private

    # Encontra a prova através do id passado pela URL
    def encontrar_prova
        begin
            @prova = Prova.find_by_id!(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'Prova não encontrada' }, status: :not_found
        end
    end
    
    def parametros_prova
        params.permit(:titulo, :duracao, questoes_attributes: [ :enunciado, :resposta_correta, escolhas_attributes: [:texto]])
    end
end
