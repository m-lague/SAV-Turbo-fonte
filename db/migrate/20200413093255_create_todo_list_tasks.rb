class CreateTodoListTasks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :todo_lists, :tasks do |t|
      t.index :todo_list_id
      t.index :task_id

      t.timestamps
    end
  end
end
