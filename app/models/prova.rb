class Prova < ApplicationRecord
    validates :titulo, presence: true
    validates :duracao, presence: true

    has_many :participante_prova, dependent: :destroy
    has_many :participantes, through: :participante_prova
end
