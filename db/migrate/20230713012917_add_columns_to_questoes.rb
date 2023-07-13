class AddColumnsToQuestoes < ActiveRecord::Migration[7.0]
  def change
    add_column :questoes, :enunciado, :string
    add_column :questoes, :respostas, :string, array: true, default: []
    add_column :questoes, :resposta_correta, :integer
  end
end
