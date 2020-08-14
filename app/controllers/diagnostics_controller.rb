class DiagnosticsController < ApplicationController
   before_action :set_diagnostic, only: [:show]
  def index
    @diagnostics = policy_scope(Diagnostic).where(stove_id: params[:stove_id])
  end

  def show

  end
  def create
    # TODO créer les formulaires de création de diagnostics pour le SAV
  end

  private

  def set_diagnostic
    @diagnostic = Diagnostic.find(params[:id])
    authorize @diagnostic
  end
end
