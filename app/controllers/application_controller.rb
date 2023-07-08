class ApplicationController < ActionController::API
    def autorizar_requisicao
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decodificado = JsonWebTokenUtilitarios.decodificar(header)
            if @decodificado != nil
                @usuario_atual = Usuario.find(@decodificado[:id_usuario])
            else
                render json: { errors: 'Token não encontrado' }, status: :unauthorized
            end
        rescue ActiveRecord::RecordNotFound => exception
            render json: { errors: exception.message }, status: :unauthorized
        rescue JWT::DecodeError => exception
            render json: { errors: exception.message }, status: :unauthorized
        end
    end
    
end
