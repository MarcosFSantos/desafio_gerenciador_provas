class UsuariosController < ApplicationController
    before_action :autorizar_requisicao, except: :criar
    before_action :encontrar_usuario, except: %i[criar listar]

    # Método de listgem de usuários
    def listar
        @usuarios = Usuario.all
        render json: @usuarios, status: :ok
    end

    # Método de exibição de um usuário
    def mostrar
        render json: @usuario, status: :ok
    end

    # Mostrar os participantes
    def listar_participantes
        render json: @usuario.participantes, status: :ok
    end
    
    # Método de criação de um usuário
    def criar
        @usuario = Usuario.new(parametros_usuario)
        @usuario.perfil = :participante unless @usuario.perfil.present?
        if @usuario.save
            render json: @usuario, status: :ok
        else
            render json: { errors: @usuario.errors.full_messages },status: :unprocessable_entity
        end
    end
    
    # Método de edição de um usuário
    def atualizar
        unless @usuario.update(parametros_usuario)
            render json: { errors: @usuario.errors.full_messages }, status: :ok
        end
    end
    
    # Método de exclusão de um usuário
    def destruir
        @usuario.destroy
    end

    private

    # Procura o usuário pela matrícula
    def encontrar_usuario
        @usuario = Usuario.find_by_matricula!(params[:matricula])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'Usuário não encontrado' }, status: :not_found
    end

    def parametros_usuario
        params.permit(:nome, :email, :matricula, :password, :password_confirmation)
    end
end
