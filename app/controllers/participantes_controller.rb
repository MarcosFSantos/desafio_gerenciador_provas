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

    def inscrever_prova
        @prova = Prova.find_by_id!(params[:prova_id])
        @participante = Participante.find_by_id!(params[:id])
        @participante.provas << @prova
        @participante.save
    end
    
    def mostrar_prova
        @prova = @participante.provas.find_by_id(params[:prova_id])
        
        if @prova.nil?
            render json: { error: 'Prova não encontrada' }, status: :not_found
        else
            render json: @prova, status: :ok
        end
    end

    def mostrar_nota_prova
        
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
