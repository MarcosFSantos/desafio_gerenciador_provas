class QuestoesController < ApplicationController
    before_action :autorizar_requisicao
    before_action :encontrar_questao, except: %i[criar listar]

    # Método de listgem de questões de provas
    def listar
        @prova = Prova.find_by(id: params[:prova_id])

        if @prova.nil?
            render json: { errors: 'Prova não encontrada' }, status: :not_found
            return
        end

        render json: @prova.questoes, status: :ok
    end

    # Método de exibição de uma questão de prova
    def mostrar
        autorizar_usuario
        render json: @questao, status: :ok
    end
    
    # Método de criação de uma questão de prova
    def criar
        @prova = Prova.find_by(id: params[:prova_id])
        
        if @prova.nil?
            render json: { errors: 'Prova não encontrada' }, status: :not_found
            return
        end
        
        @questao = @prova.questoes.build(parametros_questao)
        
        if @questao.save
            render json: @questao, status: :ok
        else
            render json: { errors: @questao.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    # Método de edição de uma questão de prova
    def atualizar
        autorizar_usuario
        unless @questao.update(parametros_questao)
            render json: { errors: @questao.errors.full_messages }, status: :ok
        end
    end
    
    # Método de exclusão de uma questão de prova
    def destruir
        autorizar_usuario
        @questao.destroy
    end

    private

    def encontrar_questao
        @prova = Prova.find_by(id: params[:prova_id])
        
        if @prova.nil?
            render json: { errors: 'Prova não encontrada' }, status: :not_found
            return
        end
        
        @questao = @prova.questoes.find_by(id: params[:questao_id])
        
        if @questao.nil?
            render json: { errors: 'Questão não encontrada' }, status: :not_found
            return
        end
    end

    def parametros_questao
        params.permit(:enunciado, :resposta_correta, escolhas_attributes: [:identificador, :texto])
    end

    def autorizar_usuario
        @prova = Prova.find_by(id: params[:prova_id])
        unless @prova.usuario == @usuario_atual
            raise StandardError.new('Acesso negado'), status: :unauthorized
        end
    end
    
end
