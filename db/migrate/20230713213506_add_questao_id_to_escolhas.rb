class AddQuestaoIdToEscolhas < ActiveRecord::Migration[7.0]
  def change
    add_reference :escolhas, :questao, foreign_key: { to_table: :questoes }
  end
end
