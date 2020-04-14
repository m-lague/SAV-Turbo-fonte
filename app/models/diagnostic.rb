class Diagnostic < ApplicationRecord
  belongs_to :alarm
  belongs_to :stove
  belongs_to :component
  belongs_to :problem
  belongs_to :phase
  has_many :todo_lists
  has_many :tickets
  has_many :displayed_diagnostics
  has_many :users, through: :displayed_diagnostics
end
