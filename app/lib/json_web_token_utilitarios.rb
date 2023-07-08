# Classe com trechos de código muito utilizados para conexão com a dependência do JWT(Jason Web Token)
class JsonWebTokenUtilitarios
    # Chave secreta para codificação e decodificação de tokens pelo JWT gerada pelo Rails.
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  
    # Função que codifica informações dentro de um token JWT.
    def self.codificar(payload)
        begin
            return nil unless payload.is_a?(Hash)
            JWT.encode(payload, SECRET_KEY)
        rescue JWT::EncodeError
            nil
        end
    end
  
    # Função que decodifica informações contidas em um token JWT.
    def self.decodificar(token)
      begin
        payload_decodificado = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new(payload_decodificado)
      rescue JWT::DecodeError
        nil
      end
    end
  
  end