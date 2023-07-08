class AddColumnsToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :nome, :string
    add_column :usuarios, :email, :string
    add_column :usuarios, :matricula, :string
    add_column :usuarios, :password_digest, :string
  end
end
