class ClientMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_ticket_created(ticket)
    @ticket = ticket
    mail :to => @ticket.email, :subject => "Your ticket has been created"
  end

  def send_response_notification(response)
    @response = response
    mail :to => response.ticket.email, :subject => "RE: Your support ticket"
  end

end
