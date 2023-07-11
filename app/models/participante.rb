class Participante < ApplicationRecord

    belongs_to(
        :usuario, # Método reponsável por retornar uma instância de 'Usuario' da instância.
        class_name: "Usuario", # Nome da classe que Participante tem relação.
        foreign_key: "usuarios_id", # Chave estrangeira de usuarios presente na tabela participantes.
        inverse_of: :participantes # Método das instâncias de 'Usuario' responsável por retornar o array de instâncias desta classe.
    )
end
