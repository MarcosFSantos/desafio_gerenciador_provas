class Resposta < ApplicationRecord
  
  attribute :dados, :jsonb, default: {}
  validate :nota

  belongs_to :prova
  belongs_to :participante
end