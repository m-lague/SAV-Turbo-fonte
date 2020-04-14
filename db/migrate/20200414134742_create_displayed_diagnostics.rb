class CreateDisplayedDiagnostics < ActiveRecord::Migration[6.0]
  def change
    create_table :displayed_diagnostics do |t|
      t.references :user, null: false, foreign_key: true
      t.references :diagnostic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
