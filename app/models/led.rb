class Led < ApplicationRecord
  has_many :alarms_leds
  has_many :alarms, through: :alarms_leds

  enum status: [:off, :on, :blink]

  def to_label
    "#{name} #{color} #{status}"
  end
end
