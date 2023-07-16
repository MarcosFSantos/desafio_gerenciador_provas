class AddNotaToRespostas < ActiveRecord::Migration[7.0]
  def change
    add_column :respostas, :nota, :integer
  end
end
