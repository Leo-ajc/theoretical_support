class Client < ActiveRecord::Base
  attr_accessible :email, :name
  validates_presence_of :email, :name
  validates_uniqueness_of :email

  has_many :tickets

end
