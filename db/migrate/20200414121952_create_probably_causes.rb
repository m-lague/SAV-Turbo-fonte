class CreateProbablyCauses < ActiveRecord::Migration[6.0]
  def change
    create_table :probably_causes do |t|
      t.text :description

      t.timestamps
    end
  end
end
