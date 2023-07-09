class ApplicationController < ActionController::API
    def autorizar_requisicao
        header = request.headers['Authorization'] # Armazena o token JWT contido no header 'Authorization' (Bearer <token>)
        header = header.split(' ').last if header # Retira a palavra Bearer que vem antes do token e deixa apenas a parte válida do token JWT
        begin
            @decodificado = JsonWebTokenUtilitarios.decodificar(header)
            if @decodificado != nil
                @usuario_atual = Usuario.find(@decodificado[:id_usuario])
            else
                render json: { errors: 'Token não encontrado' }, status: :unauthorized
            end
        rescue ActiveRecord::RecordNotFound => exception # Retorna uma mensagem de erro se não encontrar o usuário
            render json: { errors: exception.message }, status: :unauthorized
        rescue JWT::DecodeError => exception # Retorna uma mensagem de erro se não conseguir decodificar o roken
            render json: { errors: exception.message }, status: :unauthorized
        end
    end
    
end
