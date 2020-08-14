class TodoList < ApplicationRecord
  belongs_to :diagnostics, optional: true
  has_many :task_todo_lists
  has_many :tasks, through: :task_todo_lists
  enum to_do_by: [:client, :pro]
end
