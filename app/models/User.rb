class User < ActiveRecord::Base
  has_many :mechs
  has_many :messages_sent, class_name: 'Message', foreign_key: :from_id
  has_many :messages_received, class_name: 'Message', foreign_key: :to_id

  attr_accessible :name, :email, :password, :password_confirmation

  acts_as_authentic do |c|
    c.login_field = :name
    c.validate_email_field = false
  end
end
