class CreateErrorCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :error_codes do |t|
      t.string :number
      t.integer :code_log

      t.timestamps
    end
  end
end
