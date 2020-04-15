class AddReferenceStoveToPhases < ActiveRecord::Migration[6.0]
  def change
    add_reference :phases, :stove, foreign_key: true
  end
end
