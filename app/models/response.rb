class Response < ActiveRecord::Base
  attr_accessible :body, :ticket_id, :user_id

  belongs_to :ticket
  belongs_to :user
end
