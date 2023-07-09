class RemoveDefaultFromPerfilInUsuarios < ActiveRecord::Migration[7.0]
  def change
    change_column_default :usuarios, :perfil, nil
  end
end
