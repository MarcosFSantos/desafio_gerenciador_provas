class CreateRankings < ActiveRecord::Migration[7.0]
  def change
    create_table :rankings do |t|
      t.jsonb :dados, default: {}
      t.references :prova, foreign_key: true

      t.timestamps
    end
  end
end
