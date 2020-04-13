class AlarmLed < ApplicationRecord
  belongs_to :leds
  belongs_to :alarms
end
