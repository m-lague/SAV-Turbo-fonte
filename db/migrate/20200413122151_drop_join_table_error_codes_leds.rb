class DropJoinTableErrorCodesLeds < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :error_codes, :leds
  end
end
