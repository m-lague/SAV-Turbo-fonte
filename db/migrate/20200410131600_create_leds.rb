class CreateLeds < ActiveRecord::Migration[6.0]
  def change
    create_table :leds do |t|
      t.string :icon
      t.string :color
      t.integer :status

      t.timestamps
    end
  end
end
