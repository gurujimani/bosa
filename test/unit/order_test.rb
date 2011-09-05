require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
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

