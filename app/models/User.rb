class User < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation

  acts_as_authentic do |c|
    c.login_field = :name
    c.validate_email_field = false
  end
end