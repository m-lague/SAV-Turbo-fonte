class DiagnosticsController < ApplicationController
  def index
    @diagnostics = Diagnostic.all
  end

  def show

  end
end
