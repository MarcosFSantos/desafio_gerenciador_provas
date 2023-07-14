class Escolha < ApplicationRecord

    validates :identificador, presence: true, uniqueness: { scope: :questao }
    validates :texto, presence: true

    belongs_to :questao, class_name: "Questao", foreign_key: "questao_id", inverse_of: :escolhas
end
