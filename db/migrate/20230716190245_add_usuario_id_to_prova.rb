class AddUsuarioIdToProva < ActiveRecord::Migration[7.0]
  def change
    add_reference :provas, :usuario, foreign_key: true
  end
end
