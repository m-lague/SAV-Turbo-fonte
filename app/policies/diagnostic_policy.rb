class DiagnosticPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # @stove = Stove.find(params[:stove_id])
      scope.where(stove: scope.stove_id)
    end
  end
end
