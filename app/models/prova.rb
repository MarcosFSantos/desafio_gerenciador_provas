class Prova < ApplicationRecord
    validates :titulo, presence: true
    validates :duracao, presence: true

    has_many :participante_provas, dependent: :destroy
    has_many :participantes, through: :participante_provas, source: :participante
end