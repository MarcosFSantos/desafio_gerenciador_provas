class UpdateAddUsuariosFkColToParticipantes < ActiveRecord::Migration[7.0]
  def change
    add_reference :participantes, :usuario, foreign_key: true
  end
end
