class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :password_digest, :name
  validates_presence_of :password, :email, :name, :on => :create
  validates_confirmation_of :password
  validates_uniqueness_of :email

  before_create { generate_token(:auth_token) }

  has_and_belongs_to_many :tickets

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
