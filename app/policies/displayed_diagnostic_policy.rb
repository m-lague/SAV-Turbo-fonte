class DisplayedDiagnosticPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.web_developer?
  end
end
