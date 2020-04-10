class CreateStoves < ActiveRecord::Migration[6.0]
  def change
    create_table :stoves do |t|
      t.string :name
      t.string :rated_heat_output

      t.timestamps
    end
  end
end
