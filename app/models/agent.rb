class Agent < ActiveRecord::Base
  
  validates_presence_of :name, :address, :country, :telephone
  validates_uniqueness_of :email, :message => 'This email already assinged to another agent.'
end
