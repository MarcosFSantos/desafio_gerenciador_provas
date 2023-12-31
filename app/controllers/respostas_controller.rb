class RespostasController < ApplicationController

    # Método de criação de uma resposta de prova
    def criar
        @prova = Prova.find_by(id: params[:prova_id])

        if @prova.nil?
            render json: { errors: 'Prova não encontrada' }, status: :not_found
            return
        end

        @participante = Participante.find_by(id: params[:participante_id])

        if @participante.nil?
            render json: { errors: 'Participante não encontrado' }, status: :not_found
        end

        @resposta = Resposta.new(parametros_resposta)
        @resposta.prova = @prova
        @resposta.participante = @participante

        if @resposta.save
            calcular_nota_participante(params[:participante_id], params[:prova_id])
            render json: @resposta, status: :ok
        else
            render json: { errors: @resposta.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    # Método de edição de uma resposta de prova
    def atualizar
        @resposta = Resposta.find_by(participante_id: params[:participante_id], prova_id: params[:prova_id])
        if @resposta.update(parametros_resposta)
            calcular_nota_participante(params[:participante_id], params[:prova_id])
        else
            render json: { errors: @resposta.errors.full_messages }, status: :ok
        end
    end
    
    private

    def parametros_resposta
        params.permit(dados: {})
    end
    
    def calcular_nota_participante(participante_id, prova_id)
        CalcularNotaJob.perform_async(participante_id, prova_id)
    end
    
end
