# == Schema Information
# Schema version: 20101208103510
#
# Table name: customers
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  dob             :date
#  sex             :string(255)
#  street          :string(255)     not null
#  city            :string(255)     not null
#  district        :string(255)
#  postcode        :string(255)
#  country         :string(255)
#  position        :string(255)
#  ic_number       :string(255)
#  passport_number :string(255)
#  telephone       :string(255)     not null
#  mobile          :string(255)
#  email           :string(255)
#  active          :boolean         default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#

class Customer < ActiveRecord::Base
  has_many :contacts
  has_many :orders
    
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :ic_number, :message  => "can't be blank"
  validates_presence_of :passport_number, :message  => "can't be blank"
  validates_uniqueness_of :ic_number, :message => 'IC number already registered for another customer.'
  validates_uniqueness_of :passport_number, :message => 'Passport number already registered for another customer.'
  
end
