class Questao < ApplicationRecord
    self.table_name_prefix = ''
    self.table_name = 'questoes'

    validates :enunciado, presence: true
    validates :resposta_correta, presence: true

    belongs_to :prova, class_name: "Prova", foreign_key: "prova_id", inverse_of: :questoes
    accepts_nested_attributes_for :escolhas, reject_if: :all_blank, allow_destroy: true
end