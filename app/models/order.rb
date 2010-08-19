# == Schema Information
# Schema version: 20100812155350
#
# Table name: orders
#
#  id                :integer         not null, primary key
#  date              :date            not null
#  time              :time            not null
#  customer_id       :integer         not null
#  receiver_name     :string(255)     not null
#  street            :string(255)     not null
#  city              :string(255)     not null
#  postcode          :string(255)
#  district          :string(255)
#  state             :string(255)
#  country           :string(255)     not null
#  telephone         :string(255)
#  mobile_phone      :string(255)
#  email             :string(255)
#  amount            :decimal(10, 2)  not null
#  amount_to_deliver :decimal(10, 2)  not null
#  delivery_currency :string(255)     not null
#  ex_rate           :decimal(10, 2)  not null
#  delivery_status   :string(255)
#  delivered_on      :datetime
#  agent_id          :integer
#  commission        :decimal(10, 2)
#  charge            :integer(10)
#  created_at        :datetime
#  updated_at        :datetime
#
# 
#  order.rb
#  bosa
#  
#  Created by N.Subramanian on 2010-08-19.
#  Copyright 2010 N.Subramanian. All rights reserved.
# 

class Order < ActiveRecord::Base
  belongs_to :customer
  
  validates :date, :presence  => true
  validates :time, :presence  => true
  validates :customer_id, :presence  => true
  validates :receiver_name, :presence  => true
  validates :street, :presence  => true
  validates :city, :presence  => true
  validates :country, :presence  => true
  validates :amount, :presence  => true, :numericality  => true
  validates :amount_to_deliver, :presence  => true, :numericality  => true
  validates :delivery_currency, :presence  => true
  
end
