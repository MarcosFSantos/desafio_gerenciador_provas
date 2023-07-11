class CreateParticipantes < ActiveRecord::Migration[7.0]
  def change
    create_table :participantes do |t|

      t.timestamps
    end
  end
end
