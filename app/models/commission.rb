# == Schema Information
# Schema version: 20100803152528
#
# Table name: commissions
#
#  id          :integer         not null, primary key
#  from_amount :decimal(10, 2)
#  to_amount   :decimal(10, 2)
#  commission  :decimal(10, 2)
#  charge      :decimal(10, 2)
#  remarks     :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Commission < ActiveRecord::Base
  validates :from_amount, :presence => true
  validates :to_amount, :presence => true
  validates :commission, :presence => true
  validates :charge, :presence => true
end
