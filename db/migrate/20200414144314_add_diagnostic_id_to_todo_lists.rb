class AddDiagnosticIdToTodoLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :todo_lists, :diagnostic, foreign_key: true
  end
end
