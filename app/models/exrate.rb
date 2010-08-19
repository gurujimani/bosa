# == Schema Information
# Schema version: 20100807152434
#
# Table name: exrates
#
#  id           :integer         not null, primary key
#  currency_id  :integer         not null
#  ex_rate_date :date
#  buy_rate     :decimal(, )
#  sell_rate    :decimal(, )
#  created_at   :datetime
#  updated_at   :datetime
#
# 
#  exrate.rb
#  bosa
#  
#  Created by N.Subramanian on 2010-08-19.
#  Copyright 2010 N.Subramanian. All rights reserved.
# 

class Exrate < ActiveRecord::Base
  belongs_to :currency
  
  validates :currency_id, :presence  => true
  validates :ex_rate_date, :presence  => true
  validates :sell_rate, :presence  => true, :numericality  => true
  validates :buy_rate, :presence  => true, :numericality  => true
  
end
