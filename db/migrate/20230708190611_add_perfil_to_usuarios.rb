class AddPerfilToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :perfil, :string
  end
end
