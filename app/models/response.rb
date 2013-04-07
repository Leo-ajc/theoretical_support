class Response < ActiveRecord::Base
  has_paper_trail

  attr_accessible :body, :ticket_id, :user_id

  belongs_to :ticket
  belongs_to :user

  def send_response_notification
    ClientMailer.send_response_notification(self).deliver
  end

end
