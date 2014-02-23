class Message < ActiveRecord::Base
  belongs_to :from, class_name: 'User'
  belongs_to :to, class_name: 'User'

  validates_presence_of :from, :to

  def self.unread
    where(read: FALSE)
  end

  def read!
    return unless !read
    self.update_attribute(:read, TRUE)
  end
end
