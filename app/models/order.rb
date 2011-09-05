# == Schema Information
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
#  remarks           :text
#  created_at        :datetime
#  updated_at        :datetime
#  purpose_id        :integer
#  income_source_id  :integer
#

class Order < ActiveRecord::Base
  
  attr_accessor :total_amount
  
  belongs_to :customer
  belongs_to :purpose
  belongs_to :income_source
  belongs_to :agent
  
  has_many :proxy_orders
  
  #before_save :make_proxy_orders
  
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
  validates :purpose_id, :presence => true
  
  def total_amount
    amount + commission + charge
  end
  
  private
  
  def make_proxy_orders
    config = Setting.first
    
    if self.amount > config.base_currency_order_limit
      amt = self.amount
      
      until amt < config.base_currency_order_list
        
      end
         
      self.remarks = "Proxy order should be created for this order."
    end
    
    config = nil
  end
end
