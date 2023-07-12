class RemoveParticipanteProvas < ActiveRecord::Migration[7.0]
  def change
    drop_table :participante_provas
  end
end
