class AddUsuariosFkColToParticipantes < ActiveRecord::Migration[7.0]
  def change
    add_reference :participantes, :usuarios, foreign_key: true
  end
end
