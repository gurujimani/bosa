require 'test_helper'

class ProxyOrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

