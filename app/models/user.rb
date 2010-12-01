use_roles_strategy :role_string

class User < ActiveRecord::Base
  include Roles::ActiveRecord 
  strategy :role_string, :default

  valid_roles_are Cream::Role.available
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
