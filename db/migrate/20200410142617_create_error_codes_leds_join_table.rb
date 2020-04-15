class CreateErrorCodesLedsJoinTable < ActiveRecord::Migration[6.0]
  def change
      create_join_table :error_codes, :leds do |t|
        t.index :error_code_id
        t.index :led_id
      end
  end
end
