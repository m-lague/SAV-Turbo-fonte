class AlarmsLed < ApplicationRecord
  belongs_to :led
  belongs_to :alarm
end
