class Address < ActiveRecord::Base
  belongs_to :customer
  
  validates_presence_of :customer_id, :contact_person, :address, :city, :country
  
end
