class CreateEscolhas < ActiveRecord::Migration[7.0]
  def change
    create_table :escolhas do |t|

      t.timestamps
    end
  end
end
