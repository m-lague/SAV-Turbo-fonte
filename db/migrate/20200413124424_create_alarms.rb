class CreateAlarms < ActiveRecord::Migration[6.0]
  def change
    create_table :alarms do |t|
      t.text :description
      t.references :error_code, null: false, foreign_key: true

      t.timestamps
    end
  end
end
