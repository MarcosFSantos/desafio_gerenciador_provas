class Prova < ApplicationRecord
    validates :titulo, presence: true
    validates :duracao, presence: true

    has_many :participante_provas, dependent: :destroy
    has_many :participantes, through: :participante_provas, source: :participante
    
    has_one :ranking, class_name: "Ranking", foreign_key: "prova_id", dependent: :destroy, inverse_of: :prova

    has_many :questoes, class_name: "Questao", foreign_key: "prova_id", dependent: :destroy, inverse_of: :prova
    accepts_nested_attributes_for :questoes, reject_if: :all_blank, allow_destroy: true

    belongs_to :usuario, class_name: "Usuario", foreign_key: "usuario_id", inverse_of: :prova

    # Retorna as respostas de cada questão da prova
    def respostas
        respostas = {}
        questoes.each do |questao|
            escolhas_questao = questao.escolhas.pluck(:identificador)
            escolha_correta = questao.resposta_correta
            # Verifica se a escolha correta está entre as escolhas da questão, se não estiver a escolha correta é retornada como nil para a questão ser anulada
            if escolhas_questao.include?(escolha_correta)
                respostas[questao.id] = escolha_correta
            else
                respostas[questao.id] = nil
            end
        end
        respostas
    end
end