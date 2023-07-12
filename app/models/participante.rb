class Participante < ApplicationRecord
  belongs_to :usuario, class_name: "Usuario", foreign_key: "usuarios_id", inverse_of: :participantes
  has_many :participante_provas, dependent: :destroy
  has_many :provas, through: :participante_provas
end