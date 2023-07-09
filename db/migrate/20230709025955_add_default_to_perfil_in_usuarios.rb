class AddDefaultToPerfilInUsuarios < ActiveRecord::Migration[7.0]
  def change
    change_column_default :usuarios, :perfil, 0
  end
end
