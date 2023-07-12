class Prova < ApplicationRecord
    validates :titulo, presence: true
    validates :duracao, presence: true
end
