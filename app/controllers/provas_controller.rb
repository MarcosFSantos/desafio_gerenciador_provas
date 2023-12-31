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
        autorizar_usuario
        render json: @prova, status: :ok
    end

    # Mostrar os participantes
    def listar_participantes
        render json: @prova.participantes, status: :ok
    end

    def ranking_notas
        autorizar_usuario
        CalcularRankingParticipantesJob.perform_async(params[:id])
        @ranking = @prova.ranking
        
        if @ranking.nil?
          render json: { message: 'Carregando' }, status: :accepted
        else
          render json: @ranking.dados.sort_by { |nota, _| -nota }.to_h, status: :ok
        end
    end
    
    # Método de criação de um usuário
    def criar
        @prova = Prova.new(parametros_prova)
        @prova.usuario = @usuario_atual
        if @prova.save
            render json: @prova, status: :ok
        else
            render json: { errors: @prova.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    # Método de edição de um usuário
    def atualizar
        autorizar_usuario
        unless @prova.update(parametros_prova)
            render json: { errors: @prova.errors.full_messages }, status: :ok
        end
    end
    
    # Método de exclusão de um usuário
    def destruir
        autorizar_usuario
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
        params.permit(:titulo, :duracao, questoes_attributes: [ :enunciado, :resposta_correta, escolhas_attributes: [:identificador, :texto]])
    end

    def autorizar_usuario
        unless @prova.usuario == @usuario_atual
            raise StandardError.new('Acesso negado'), status: :unauthorized
        end
    end
    
end
