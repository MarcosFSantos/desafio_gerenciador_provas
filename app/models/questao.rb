class Questao < ApplicationRecord

    validates :enunciado, presence: true
    attribute :respostas, :jsonb, default: []
    validates :resposta_correta, presence: true

    # Adiciona uma resposta
    def adicionar_resposta(resposta)
        self.respostas << resposta
    end
    
    # Edita uma resposta
    def editar_resposta(indice, nova_resposta)
        self.respostas[indice] = nova_resposta
    end
    
end
