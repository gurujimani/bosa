# == Schema Information
# Schema version: 20100930135636
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  failed_attempts      :integer         default(0)
#  unlock_token         :string(255)
#  locked_at            :datetime
#  created_at           :datetime
#  updated_at           :datetime
#  username             :string(255)
#  userlevel            :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :confirmable,
  devise :database_authenticatable, :registerable, :timeoutable, :lockable,  
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username, :userlevel
  
  validates_presence_of :username, :message => "can't be blank"
  #validates_presence_of :userlevel, :message  => "Please assing a user level"

  # Array holding the user level details
  USER_LEVEL = [
    ["User", "User"],
    ["Agent", "Agent"],
    ["Admin", "Admin"]
  ]
    
  def admin?
    userlevel == "Admin"
  end
  
    
end
