class CreateQuestaos < ActiveRecord::Migration[7.0]
  def change
    create_table :questoes do |t|

      t.timestamps
    end
  end
end
