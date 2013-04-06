class Ticket < ActiveRecord::Base
  attr_accessible :body, :email, :department_id, :user_id, :status_id, :name
  attr_accessor :name # non-db attribute. For collecting the client name while creating a new Ticket
  validates_presence_of :email, :name, :body
  validates :email, :uniqueness => true, :on => :create
  validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  belongs_to :department
  belongs_to :user
  belongs_to :status
  has_one :client, :foreign_key => :email
  has_many :responses

  before_create { generate_serial_number(:serial_code) }

  def generate_serial_number(column)
    begin
      self[column] = URI::escape("#{Department.find(department_id).name}-#{SecureRandom.random_number(10000)}")
    end while Ticket.exists?(column => self[column])
  end

  def send_ticket_creation_confirmation
    ClientMailer.confirmation_ticket_created(self).deliver
  end

end
