class RevertAddNomeToParticipantes < ActiveRecord::Migration[7.0]
  def change
    remove_column :participantes, :nome, :string
  end
end
