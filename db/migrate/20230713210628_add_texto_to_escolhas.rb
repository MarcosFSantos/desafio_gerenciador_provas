class AddTextoToEscolhas < ActiveRecord::Migration[7.0]
  def change
    add_column :escolhas, :texto, :string
  end
end
