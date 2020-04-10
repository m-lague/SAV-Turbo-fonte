class Led < ApplicationRecord
  enum status: [:on, :off, :blink]
end
