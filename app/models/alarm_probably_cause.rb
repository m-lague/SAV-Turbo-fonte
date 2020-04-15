class AlarmProbablyCause < ApplicationRecord
  belongs_to :probably_cause
  belongs_to :alarm
end
