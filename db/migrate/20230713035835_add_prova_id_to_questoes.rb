class AddProvaIdToQuestoes < ActiveRecord::Migration[7.0]
  def change
    add_reference :questoes, :prova, foreign_key: true
  end
end
