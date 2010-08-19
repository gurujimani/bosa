# == Schema Information
# Schema version: 20100807152434
#
# Table name: agents
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  street     :string(255)     not null
#  city       :string(255)
#  postcode   :string(255)
#  district   :string(255)
#  state      :string(255)
#  country    :string(255)     not null
#  telephone  :string(255)     not null
#  mobile     :string(255)
#  email      :string(255)
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Agent < ActiveRecord::Base
  
  validates_presence_of :name, :street, :country, :telephone
  validates_uniqueness_of :email, :message => 'This email already assinged to another agent.'
end
