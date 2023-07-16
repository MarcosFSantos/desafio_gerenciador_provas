class Ranking < ApplicationRecord
  attribute :dados, :jsonb, default: {}
  belongs_to :prova, class_name: "Prova", foreign_key: "prova_id", inverse_of: :ranking
end
