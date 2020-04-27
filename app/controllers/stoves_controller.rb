class StovesController < ApplicationController
  before_action :set_stove, only: :show

  def index
    @stoves = policy_scope(Stove)
    @stove = Stove.new
  end

  def show

  end

  private

  def set_stove
    @stove = Stove.find(params[:id])
    authorize @stove
  end
end
