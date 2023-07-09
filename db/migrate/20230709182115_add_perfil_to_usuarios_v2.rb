class AddPerfilToUsuariosV2 < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :perfil, :integer, default: 1
  end
end
