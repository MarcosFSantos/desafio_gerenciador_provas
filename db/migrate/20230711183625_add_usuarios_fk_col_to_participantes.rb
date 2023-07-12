class AddUsuarioIdToParticipantes < ActiveRecord::Migration[7.0]
  def change
    add_reference :participantes, :usuario, foreign_key: true
    remove_reference :participantes, :usuarios # Remove a coluna usuarios_id
  end
end