class Resposta < ApplicationRecord
  
  attribute :dados, :jsonb, default: {}

  belongs_to :prova
  belongs_to :participante
end