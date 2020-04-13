class Alarm < ApplicationRecord
  belongs_to :error_code

  has_many :alarms_leds
  has_many :leds, through: :alarms_leds
end
