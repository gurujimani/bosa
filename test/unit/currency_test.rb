require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
# == Schema Information
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

