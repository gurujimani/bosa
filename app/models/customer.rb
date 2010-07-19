class Customer < ActiveRecord::Base
  
  validates_presence_of :name, :message => "can't be blank"
  validates_uniqueness_of :ic_number, :message => 'IC number already registered for another customer.'
  validates_uniqueness_of :passport_number, :message => 'Passport number already registered for another customer.'
  
end
