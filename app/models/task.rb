class Task < ApplicationRecord
  has_many :task_todo_lists
  has_many :todo_lists, through: :task_todo_lists
  enum status: [:to_do, :done]
end
