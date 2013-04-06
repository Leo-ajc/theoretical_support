class Status < ActiveRecord::Base
  attr_accessible :description
  validates_presence_of :description
  validates_uniqueness_of :description

  has_many :tickets

end
