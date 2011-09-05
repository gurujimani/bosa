require 'spec_helper'

describe Customer do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: customers
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  dob             :date
#  sex             :string(255)
#  street          :string(255)     not null
#  city            :string(255)     not null
#  district        :string(255)
#  postcode        :string(255)
#  country         :string(255)
#  position        :string(255)
#  ic_number       :string(255)
#  passport_number :string(255)
#  telephone       :string(255)     not null
#  mobile          :string(255)
#  email           :string(255)
#  active          :boolean         default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#

