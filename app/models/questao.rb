class Questao < ApplicationRecord
    self.table_name_prefix = ''
    self.table_name = 'questoes'

    validates :enunciado, presence: true
    attribute :respostas, :string, default: [], array: true
    validates :resposta_correta, presence: true

    belongs_to :prova, class_name: "Prova", foreign_key: "prova_id", inverse_of: :questoes

    # Adiciona uma resposta
    def adicionar_resposta(resposta)
        self.respostas << resposta
    end

    # Edita uma resposta
    def editar_resposta(indice, nova_resposta)
        self.respostas[indice] = nova_resposta
end
end