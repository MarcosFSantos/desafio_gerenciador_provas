class RemoveUsuariosIdAndRenameUsuarioIdInParticipantes < ActiveRecord::Migration[7.0]
  def change
    remove_column :participantes, :usuarios_id
    rename_column :participantes, :usuario_id, :usuarios_id
  end
end
