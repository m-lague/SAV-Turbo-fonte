class DisplayedDiagnostic < ApplicationRecord
  belongs_to :user
  belongs_to :diagnostic
end
