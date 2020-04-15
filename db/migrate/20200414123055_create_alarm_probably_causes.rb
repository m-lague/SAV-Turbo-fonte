class CreateAlarmProbablyCauses < ActiveRecord::Migration[6.0]
  def change
    create_table :alarm_probably_causes do |t|
      t.references :probably_cause, null: false, foreign_key: true
      t.references :alarm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
