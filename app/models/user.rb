class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :confirmable,
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  validates_presence_of :username, :message => "can't be blank"
end
