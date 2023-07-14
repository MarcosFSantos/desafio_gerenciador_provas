class AddIdentificadorToEscolhas < ActiveRecord::Migration[7.0]
  def change
    add_column :escolhas, :identificador, :integer
    add_index :escolhas, [:questao_id, :identificador], unique: true
  end
end
