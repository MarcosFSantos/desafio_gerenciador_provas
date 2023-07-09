class RemoveDefaultFromPerfilInUsuarios < ActiveRecord::Migration[7.0]
  def change
    change_column_default :usuarios, :perfil, from: 1, to: nil
  end
end