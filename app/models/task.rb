class Task < ApplicationRecord
  has_and_belongs_to_many :todo_lists
  enum status: [:not_checked, :checked]
end
