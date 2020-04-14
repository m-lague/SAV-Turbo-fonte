class AddDiagnosticIdToTickets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :diagnostic, foreign_key: true
  end
end
