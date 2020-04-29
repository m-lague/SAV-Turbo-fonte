class DisplayedDiagnosticsController < ApplicationController

  def index
  end
  def new
    @displayed_diagnostic = DisplayedDiagnostic.new
    authorize @displayed_diagnostic
  end

  def create
    alarm = Alarm.where(description: params[:displayed_diagnostic][:diagnostic][:alarm])
    phase = Phase.where(stove: params[:displayed_diagnostic][:diagnostic][:stove])
    diag = Diagnostic.where(alarm: alarm, phase: phase)
    @displayed_diagnostic = DisplayedDiagnostic.new()
    authorize @displayed_diagnostic
    @displayed_diagnostic.save
    stove = @displayed_diagnostic.diagnostic.stove
    redirect_to stove_diagnostic_path(stove)
  end

  private

  def displayed_diagnostic_params
    params.require(:displayed_diagnostic).permit(:diagnostic[:alarm], :diagnostic[:leds], :diagnostic[:phase], :diagnostic[:stove])
  end
end
