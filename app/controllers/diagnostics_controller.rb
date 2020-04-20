class DiagnosticsController < ApplicationController
  def index
    @stove = Stove.find(params[:stove_id])
    @diagnostics = Diagnostic.where(stove: @stove)
  end

  def show
    @diagnostic = Diagnostic.find(params[:id])
  end
end
