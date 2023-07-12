class CreateParticipanteProvas < ActiveRecord::Migration[7.0]
  def change
    drop_table :participante_provas # Remove a tabela existente

    create_table :participante_provas, id: false do |t|
      t.references :participante, null: false, foreign_key: { to_table: :participantes }
      t.references :prova, null: false, foreign_key: { to_table: :provas }

      t.timestamps
    end
  end
end