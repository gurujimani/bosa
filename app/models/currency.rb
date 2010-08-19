# == Schema Information
# Schema version: 20100804142447
#
# Table name: currencies
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  country    :string(255)     not null
#  full_name  :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#
# 
#  currency.rb
#  bosa
#  
#  Created by N.Subramanian on 2010-08-19.
#  Copyright 2010 N.Subramanian. All rights reserved.
# 

class Currency < ActiveRecord::Base
  has_many :exrates

  # Scope to find the current exchange rate for the currency
  #scope :currentrate, joins(:exrates).order("exrates.ex_rate_date DESC").limit(1)  

  # Validation begins 
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 3 }
  validates :country, :presence  => true
  
  def current
    @rate = self.exrates.order("exrates.ex_rate_date DESC").first
    @rate.buy_rate
  end
end
