class Phase < ApplicationRecord
  belongs_to :stove
  has_many :diagnostics
end
