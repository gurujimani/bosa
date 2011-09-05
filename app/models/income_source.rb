class IncomeSource < ActiveRecord::Base
  has_many :orders
  
  validates :name, :presence => true
end
# == Schema Information
#
# Table name: income_sources
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

