class RemoveUsuariosIdAndRenameUsuarioIdInParticipantes < ActiveRecord::Migration[7.0]
  def up
    remove_column :participantes, :usuarios_id if column_exists?(:participantes, :usuarios_id)
  end
  def change
    rename_column :participantes, :usuario_id, :usuarios_id
  end
end
