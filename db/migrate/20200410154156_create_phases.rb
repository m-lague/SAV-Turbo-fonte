class CreatePhases < ActiveRecord::Migration[6.0]
  def change
    create_table :phases do |t|
      t.string :name
      t.text :goal
      t.string :charge
      t.boolean :heating_system
      t.boolean :smoke_extractor

      t.timestamps
    end
  end
end
