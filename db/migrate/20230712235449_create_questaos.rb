class CreateQuestaos < ActiveRecord::Migration[7.0]
  def change
    create_table :questaos do |t|

      t.timestamps
    end
  end
end
