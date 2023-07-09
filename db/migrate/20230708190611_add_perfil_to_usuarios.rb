class AddPerfilToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :perfil, :integer, default: 1
    Usuario.update_all(perfil: 1)
  end
end