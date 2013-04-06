class SearchController < ApplicationController

  def search
    if params[:serial_code]
      @ticket = Ticket.find_by_serial_code(params[:serial_code])
    end
    if @ticket.nil?
      render 'search', :notice => 'no matches found'
    end
  end

end
