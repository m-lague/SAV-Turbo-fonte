class AddDurationToPhases < ActiveRecord::Migration[6.0]
  def change
    add_column :phases, :duration, :integer
  end
end
