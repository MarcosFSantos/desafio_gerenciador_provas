class ParticipantesController < ApplicationController
    before_action :autorizar_requisicao
    before_action :encontrar_participante, except: %i[criar listar]

    # Método de listgem de participante
    def listar
        @participantes = Participante.all
        render json: @participantes, status: :ok
    end

    def listar_provas
        render json: @participante.provas, status: :ok
    end
    
    def mostrar_prova
        if @participante.provas.pluck(:id).include?(:prova_id) # Verifica se o participante esta escrito em alguma prova com o id passado
            @prova = Prova.find_by_id!(params[:prova_id])
            if @prova = nil?
                render json: { errors: 'Prova não encontrada' }, status: :not_found
                return
            end
            render json: @prova, status: :ok
        else
            render json: { error: 'Participante não está inscrito nessa prova' }, status: :unauthorized
        end
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
