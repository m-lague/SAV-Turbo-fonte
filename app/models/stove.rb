class Stove < ApplicationRecord
  has_many :diagnostics
  has_many :phases
end
