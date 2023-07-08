class AutenticacaoController < ApplicationController
    before_action :autorizar_requisicao, except: :login

    # Método de exibição da página de login
    def login
        @usuario = Usuario.find_by_email(params[:email])
        if @usuario&.authenticate(params[:password])
            token = JsonWebTokenUtilitarios.codificar(id_usuario: @usuario.id)
            tempo = Time.now + 24.hours.to_i
            render json: { token: token, expiracao: tempo.strftime("%m-%d-%Y %H:%M"), matricula: @usuario.matricula }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

   private

   def parametros_login
    params.permit(:email, :password)
   end
   
end
