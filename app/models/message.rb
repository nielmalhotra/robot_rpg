class Message < ActiveRecord::Base
  belongs_to :from, class_name: 'User'
  belongs_to :to, class_name: 'User'

  validates_presence_of :from, :to

  def self.unread
    where(read: FALSE)
  end

  def read!
    return if read
    self.update_attribute(:read, TRUE)
  end

  def from_name
    from.name
  end

  def attributes
  {
      id: id,
      subject: subject,
      body: body,
      read: read,
      from_name: from_name
  }
  end
end
