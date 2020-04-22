class DiagnosticsController < ApplicationController
  before_action :set_diagnostic, only: :show
  def index
    # @stove = Stove.find(params[:stove_id])
    @diagnostics = policy_scope(Diagnostic)
  end

  def show
  end

  private

  def set_diagnostic
    @diagnostic = Diagnostic.find(params[:id])
    authorize @diagnostic
  end
end
