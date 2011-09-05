class ProxyOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :proxy_address
  
  validates :order_id, :presence => true
  validates :proxy_order_id, :presence => true  
  validates :date, :presence  => true
  validates :amount, :presence  => true, :numericality  => true
  validates :amount_to_deliver, :presence  => true, :numericality  => true
  validates :delivery_currency, :presence  => true
  validates :purpose_id, :presence => true

end
# == Schema Information
#
# Table name: proxy_orders
#
#  id                :integer         not null, primary key
#  order_id          :integer         not null
#  proxy_address_id  :integer         not null
#  date              :date            not null
#  amount            :decimal(10, 2)  not null
#  amount_to_deliver :decimal(10, 2)  not null
#  delivery_currency :string(255)     not null
#  ex_rate           :decimal(10, 2)  not null
#  commission        :decimal(10, 2)
#  charge            :integer(10)
#  created_at        :datetime
#  updated_at        :datetime
#

