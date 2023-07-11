class ParticipantesController < ApplicationController
    before_action :autorizar_requisicao
    before_action :encontrar_participante

    # Método de listgem de participante
    def listar
        @participantes = Participante.all
        render json: @participantes, status: :ok
    end

    # Método de exibição de um participante
    def mostrar
        render json: @participante, status: :ok
    end
    
    # Método de criação de um participante
    def criar
        @participante = Participante.new(usuario: @usuario_atual)
        if @participante.save
            render json: @participante, status: :ok
        else
            render json: { errors: @participante.errors.full_messages },status: :unprocessable_entity
        end
    end
    
    # Método de edição de um participante
    def atualizar
        render json: { mensagem: 'Nada para atualizar' }, status: :ok
    end
    
    # Método de exclusão de um participante
    def destruir
        @participante.destroy
    end

    private

    # Encontra o participante através do id passado pela URL
    def encontrar_participante
        begin
            @participante = Participante.find_by_id!(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'Participante não encontrado' }, status: :not_found
        end
    end
    
end
