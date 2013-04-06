class ClientInterfacesController < ApplicationController

  def new_ticket
    @ticket = Ticket.new
  end

  def edit_ticket
    @ticket = Ticket.find(params[:id])
  end

  def history
    @ticket = Ticket.find_by_serial_code(params[:serial_code])
  end


  def create_ticket
    @ticket = Ticket.new(params[:ticket])
    unless params[:ticket][:email].blank?
      @client = Client.find_or_create_by_email(params[:ticket][:email])
      @client.name = params[:ticket][:name]
    end

    #setting default status
    # Remember seed.rb for the db. to get default values.
    @ticket.status_id = Status.find_by_description('Waiting for Staff Response').id

    if @ticket.save && @client.save
      @ticket.send_ticket_creation_confirmation if @ticket
      redirect_to ticket_history_path(@ticket.serial_code), notice: 'Ticket was successfully created.'
    else
      render action: "new_ticket", notice: 'Ticket was not created, please try again.'
    end
  end

  def update_ticket
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to ticket_history_path(@ticket.id), notice: 'Ticket was successfully updated'
    else
      render action: "new_ticket", notice: 'Ticket was not updated, please try again.'
    end
  end

end

