class RenameColumnIconToLeds < ActiveRecord::Migration[6.0]
  def change
    rename_column :leds, :icon, :name
  end
end
