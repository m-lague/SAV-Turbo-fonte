class CreateAlarmsLeds < ActiveRecord::Migration[6.0]
  def change
    create_table :alarms_leds do |t|
      t.references :led, null: false, foreign_key: true
      t.references :alarm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
