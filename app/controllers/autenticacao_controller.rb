class AutenticacaoController < ApplicationController

    # Método de exibição da página de login
    def login
        render json: {pagina: 'Você está na página de login'}, status: :ok
    end
end
