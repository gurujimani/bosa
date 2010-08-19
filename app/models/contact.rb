# == Schema Information
# Schema version: 20100808035915
#
# Table name: contacts
#
#  id             :integer         not null, primary key
#  customer_id    :integer         not null
#  contact_person :string(255)     not null
#  dob            :date
#  sex            :string(255)
#  relationship   :string(255)
#  street         :string(255)     not null
#  city           :string(255)     not null
#  postcode       :string(255)
#  district       :string(255)
#  state          :string(255)
#  country        :string(255)     not null
#  telephone      :string(255)
#  mobile         :string(255)
#  email          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Contact < ActiveRecord::Base
  belongs_to :customer
  
  validates :customer_id, :presence  => true
  validates :contact_person, :presence  => true
  validates :street, :presence => true
  validates :city, :presence  => true
  validates :country, :presence  => true
 
end
