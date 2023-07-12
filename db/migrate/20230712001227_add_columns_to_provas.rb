class AddColumnsToProvas < ActiveRecord::Migration[7.0]
  def change
    add_column :provas, :titulo, :string
    add_column :provas, :duracao, :integer
  end
end
