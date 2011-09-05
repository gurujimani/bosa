require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
# == Schema Information
#
# Table name: agents
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  street     :string(255)     not null
#  city       :string(255)
#  postcode   :string(255)
#  district   :string(255)
#  state      :string(255)
#  country    :string(255)     not null
#  telephone  :string(255)     not null
#  mobile     :string(255)
#  email      :string(255)
#  active     :boolean         default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

