class Usuario < ApplicationRecord
    has_secure_password # Usa o BCrypt para armazenar a senha "password" em um hash criptografado chamado "password_digest"

    validates :nome, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :matricula, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

    enum perfil: { administrador: 0, participante: 1 }, _default: :participante

    has_many(
        :participantes, # Método responsável por retornar o array de 'Participante' da instância.
        class_name: "Participante", # Nome da classe que Usuario tem relação.
        foreign_key: "usuarios_id", # Chave estrangeira de usuarios presente na tabela participantes.
        inverse_of: :usuario, # Método das instâncias de 'Participante' reponsável por retornar uma instância dessa classe.
        dependent: :destroy # Destruir as instâncias de 'Participante' dependentes ao destruir uma instância desta classe.
    )
end