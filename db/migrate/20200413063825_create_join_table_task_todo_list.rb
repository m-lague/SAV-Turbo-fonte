class CreateJoinTableTaskTodoList < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tasks, :todo_lists do |t|
      t.index [:task_id, :todo_list_id]
      t.index [:todo_list_id, :task_id]
    end
  end
end
