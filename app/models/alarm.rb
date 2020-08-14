class Alarm < ApplicationRecord
  belongs_to :error_code

  has_many :alarms_leds
  has_many :leds, through: :alarms_leds

  has_many :alarm_probably_causes
  has_many :probably_causes, through: :alarm_probably_causes
  has_many :diagnostics
end
