class ProbablyCause < ApplicationRecord
  has_many :alarm_probably_causes
  has_many :alarms, through: :alarm_probably_causes
end
