class RenameTasksTodoLists < ActiveRecord::Migration[6.0]
  def change
    rename_table :tasks_todo_lists, :task_todo_lists
  end
end
