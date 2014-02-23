class Robot < ActiveRecord::Base
  belongs_to :user
  has_many :slots
end
