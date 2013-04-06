class TicketsController < ApplicationController

  def open_tickets
    @tickets = Status.find_by_description('Waiting for Staff Response').tickets
  end

  def on_hold_tickets
    @tickets = Status.find_by_description('On Hold').tickets
  end

  def closed_tickets
    @tickets = Status.find_by_description('Completed').tickets
  end

  def cancelled_tickets
    @tickets = Status.find_by_description('Cancelled').tickets
  end

  def unassigned_tickets
    @tickets = Ticket.where(:user_id => nil)
  end

  def versions
    @ticket = Ticket.find(params[:id])
    @ticket = @ticket.version_at(params[:timestamp]).recify
    @ticket.save
  end

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(params[:ticket])
    @client = Client.find_or_create_by_email(params[:ticket][:email]) unless params[:ticket][:email].blank?
    @client.name = params[:ticket][:name]
    @ticket.status_id = Status.find_by_description('Waiting for Staff Response').first.id

    respond_to do |format|
      if @ticket.save && @client.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end
end
