class Prova < ApplicationRecord
    validates :titulo, presence: true
    validates :duracao, presence: true

    has_many :participante_provas, dependent: :destroy
    has_many :participantes, through: :participante_provas, source: :participante

    has_many :questoes, class_name: "Questao", foreign_key: "prova_id", dependent: :destroy, inverse_of: :prova
    accepts_nested_attributes_for :questoes, reject_if: :all_blank, allow_destroy: true
end