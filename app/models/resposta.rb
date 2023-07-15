class Resposta < ApplicationRecord
  
  serialize :dados, Hash

  belongs_to :prova
  belongs_to :participante
end