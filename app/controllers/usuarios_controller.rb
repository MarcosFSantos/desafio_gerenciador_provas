class UsuariosController < ApplicationController

    # Método de listgem de usuários
    def listar
        render json: {pagina: 'Você está na página de listagem de usuário'}, status: :ok
    end

    # Método de exibição de um usuário
    def mostrar
        render json: {pagina: 'Você está na página de exibição de um usuário'}, status: :ok
    end
    
    # Método de criação de um usuário
    def criar
        render json: {pagina: 'Você está na página de criação de um usuário'}, status: :ok
    end
    
    # Método de edição de um usuário
    def atualizar
        render json: {pagina: 'Você está na página de edição de um usuário'}, status: :ok
    end
    
    # Método de exclusão de um usuário
    def destruir
        render json: {pagina: 'Você está na página de exclusão de um usuário'}, status: :ok
    end
end
