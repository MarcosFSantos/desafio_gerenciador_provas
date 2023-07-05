class UsuariosController < ApplicationController

    # Método de listgem de usuários
    def index
        render json: {pagina: 'Você está na página de listagem de usuário'}, status: :ok
    end

    # Método de exibição de um usuário
    def show
        render json: {pagina: 'Você está na página de exibição de um usuário'}, status: :ok
    end
    
    # Método de criação de um usuário
    def create
        render json: {pagina: 'Você está na página de criação de um usuário'}, status: :ok
    end
    
    # Método de edição de um usuário
    def update
        render json: {pagina: 'Você está na página de edição de um usuário'}, status: :ok
    end
    
    # Método de exclusão de um usuário
    def destroy
        render json: {pagina: 'Você está na página de exclusão de um usuário'}, status: :ok
    end
end
