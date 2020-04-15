class CreateDiagnostics < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnostics do |t|
      t.references :alarm, null: false, foreign_key: true
      t.references :stove, null: false, foreign_key: true
      t.references :component, null: false, foreign_key: true
      t.references :problem, null: false, foreign_key: true
      t.references :phase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
