class Led < ApplicationRecord
  has_many :alarms_leds
  has_many :alarms, through: :alarms_leds

  enum status: [:on, :off, :blink]
end
