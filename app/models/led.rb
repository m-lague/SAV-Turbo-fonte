class Led < ApplicationRecord
  has_and_belongs_to_many :error_codes
  enum status: [:on, :off, :blink]
end
