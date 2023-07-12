class CreateParticipanteProvas < ActiveRecord::Migration[7.0]
  def change
    create_table :participante_provas do |t|
      t.references :participantes, null: false, foreign_key: true
      t.references :provas, null: false, foreign_key: true

      t.timestamps
    end
  end
end
