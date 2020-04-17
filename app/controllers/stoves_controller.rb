class StovesController < ApplicationController
  # before_action find_stove, only: :show
  def index
    @stoves = Stove.all
  end

  def show
    @stove = Stove.find(params[:id])
  end

  private

  def find_stove
    @stove = Stove.find(params[:id])
  end
end
