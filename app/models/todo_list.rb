class TodoList < ApplicationRecord
  has_and_belongs_to_many :tasks
  enum to_do_by: [:customer, :pro]
end
