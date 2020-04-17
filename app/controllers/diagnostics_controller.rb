class DiagnosticsController < ApplicationController
  def index
    @diagnostics = Diagnostic.all
    @stove = Stove.find(params[:stove_id])
  end

  def show
    @diagnostic = Diagnostic.find(params[:id])
  end
end
