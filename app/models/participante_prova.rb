class ParticipanteProva < ApplicationRecord
  self.table_name = 'participante_provas'

  belongs_to :participante
  belongs_to :prova
end