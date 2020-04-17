class StovesController < ApplicationController
  def index
    @stoves = Stove.all
  end
end
