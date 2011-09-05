require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
# == Schema Information
#
# Table name: settings
#
#  id                  :integer         not null, primary key
#  company_name        :string(255)     not null
#  street              :string(255)     not null
#  city                :string(255)
#  postcode            :string(255)
#  country             :string(255)
#  telephone           :string(255)
#  mobile              :string(255)
#  email               :string(255)
#  website             :string(255)
#  business_license_no :string(255)
#  base_currency       :string(255)     not null
#  base_currency_name  :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

