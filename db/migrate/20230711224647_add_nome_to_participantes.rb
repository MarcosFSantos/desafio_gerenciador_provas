class AddNomeToParticipantes < ActiveRecord::Migration[7.0]
  def change
    add_column :participantes, :nome, :string
  end
end
