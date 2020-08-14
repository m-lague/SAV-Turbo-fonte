class DisplayedDiagnosticsController < ApplicationController

  def index
  end
  def new
    @error_codes = ErrorCode.all.map { |e| e.number}
    @alarms = Alarm.all
    @leds = Led.not_off
    @stove = Stove.find(params[:stove_id])
    @phases = Phase.where(stove_id: params[:stove_id])
    @displayed_diagnostic = DisplayedDiagnostic.new
    authorize @displayed_diagnostic
    flash[:stove_id] = params[:stove_id]
  end

  def create

    error_code = ErrorCode.find_by number: params[:displayed_diagnostic][:diagnostic][:error_code]


    params[:displayed_diagnostic][:diagnostic][:leds].shift

    leds = []
    params[:displayed_diagnostic][:diagnostic][:leds].each do |id|
      leds << Led.find(id)
    end

    alarms = Alarm.where(error_code: error_code)
    alarm = alarms.find {|alarm| alarm.leds == leds}

    # binding.pry

    phase = Phase.find(params[:displayed_diagnostic][:diagnostic][:phase_id])

    stove = Stove.find(flash[:stove_id])


    diag = Diagnostic.find_by(alarm: alarm, phase: phase, stove: stove)

    displayed_diagnostic = DisplayedDiagnostic.new(diagnostic: diag, user: current_user)
    if diag.nil?
      authorize displayed_diagnostic
      flash[:alert] = "Diagnostique inexistant"
      redirect_to new_stove_displayed_diagnostic_path(stove)
    else
      authorize displayed_diagnostic
      displayed_diagnostic.save
      redirect_to stove_diagnostic_path(stove,diag)
    end

  end

  private
# TODO vérifier qu'on ne puisse pas passer de paramètres cachés depuis le formulaire new
  def displayed_diagnostic_params
    params.require(:displayed_diagnostic).permit(:diagnostic[:error_code], :diagnostic[:leds], :diagnostic[:phase_id])
  end
end
