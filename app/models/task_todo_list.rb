class TaskTodoList < ApplicationRecord
  belongs_to :todo_list
  belongs_to :task
end
