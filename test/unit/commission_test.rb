require 'test_helper'

class CommissionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
# == Schema Information
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
#  active      :boolean
#

