class RemovePerfilFromUsuarios < ActiveRecord::Migration[7.0]
  def change
    remove_column :usuarios, :perfil
  end
end
