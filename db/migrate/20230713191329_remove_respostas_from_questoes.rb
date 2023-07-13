class RemoveRespostasFromQuestoes < ActiveRecord::Migration[7.0]
  def change
    remove_column :questoes, :respostas, :string, array: true, default: []
  end
end
