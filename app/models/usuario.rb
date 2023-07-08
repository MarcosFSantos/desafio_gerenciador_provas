class Usuario < ApplicationRecord
    has_secure_password

    validates :nome, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :matricula, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

    enum perfil: { administrador: 0, participante: 1 }
end