require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
# == Schema Information
#
# Table name: contacts
#
#  id             :integer         not null, primary key
#  customer_id    :integer         not null
#  contact_person :string(255)     not null
#  dob            :date
#  sex            :string(255)
#  relationship   :string(255)
#  street         :string(255)     not null
#  city           :string(255)     not null
#  postcode       :string(255)
#  district       :string(255)
#  state          :string(255)
#  country        :string(255)     not null
#  telephone      :string(255)
#  mobile         :string(255)
#  email          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

