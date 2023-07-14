class EscolhasController < ApplicationController
    before_action :autorizar_requisicao


    # Método de listgem de escolhas de questões de provas
    def listar
        @questao = Questao.find_by(id: params[:questao_id])
        
        if @questao.nil?
            render json: { errors: 'Questão não encontrada' }, status: :not_found
            return
        end

        render json: @questao.escolhas, status: :ok
    end

    # Método de exibição de uma escolha de uma questão de prova
    def mostrar
        render json: @escolha, status: :ok
    end
    
    # Método de criação de uma escolha de uma questão de prova
    def criar
        @questao = Questao.find_by(id: params[:questao_id])

        if @questao.nil?
            render json: { errors: 'Prova não encontrada' }, status: :not_found
            return
        end

        @escolha = @questao.escolhas.build(parametros_escolha)

        if test
            render json: @escolha, status: :ok
        else
            render json: { errors: @escolha.errors.full_messages }, status: :unprocessable_entity
        end
        
    end
    
    # Método de edição de uma escolha de uma questão de prova
    def atualizar
        unless @escolha.update(parametros_escolha)
            render json: { errors: @ecolha.errors.full_messages }, status: :ok
        end
    end
    
    # Método de exclusão de uma escolha de uma questão de prova
    def destruir
        @escolha.destroy
    end

    private

    def encontrar_escolha
        @questao = Questao.find_by(id: params[:questao_id])
        
        if @questao.nil?
            render json: { errors: 'Questão não encontrada' }, status: :not_found
            return
        end

        @escolha = @questao.escolhas.find_by(id: params[:escolha_id])

        if @escolha.nil?
            render json: { errors: 'Escolha não encontrada' }, status: :not_found
            return
        end
    end
    
    def parametros_escolha
        params.permit(:identificador, :texto)
    end
    
end
