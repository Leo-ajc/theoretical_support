class ResponsesController < ApplicationController

  def index
    @responses = Response.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @response }
    end
  end

  def new
    @response = Response.new
    @ticket = Ticket.find_by_serial_code(params[:serial_code])
    @response.ticket_id = @ticket.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end

  def edit
    @response = Response.find(params[:id])
  end

  def create
    @response = Response.new(params[:response])

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response.ticket, notice: 'Response was successfully created.' }
        format.json { render json: @response, status: :created, location: @response }
      else
        format.html { render response: "new" }
        format.json { render json: @response.ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to @response.ticket, notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render response: "edit" }
        format.json { render json: @response.ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @ticket = @response.ticket.clone
    @response.destroy

    respond_to do |format|
      format.html { redirect_to ticket_url(:id => @ticket.id) }
      format.json { head :no_content }
    end
  end
end
