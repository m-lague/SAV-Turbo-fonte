class TicketsController < ApplicationController

  def new
    @ticket = Ticket.build(ticket_params)
  end

  def create
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :diagnostic)
  end
end
