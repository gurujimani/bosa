class ProxyAddress < ActiveRecord::Base
  
  has_many :proxy_orders
  
  validates :customer, :presence => true
  validates :receiver_name, :presence => true
  validates :street, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true

end
# == Schema Information
#
# Table name: proxy_addresses
#
#  id              :integer         not null, primary key
#  customer        :string(255)     not null
#  icno            :string(255)
#  passport        :string(255)
#  customer_mobile :string(255)
#  receiver_name   :string(255)     not null
#  street          :string(255)     not null
#  city            :string(255)     not null
#  postcode        :string(255)
#  district        :string(255)
#  state           :string(255)
#  country         :string(255)     not null
#  telephone       :string(255)
#  mobile_phone    :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

