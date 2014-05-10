class Event < ActiveRecord::Base
  belongs_to :user

  def self.read
    Event.where(read: true)
  end

  def self.unread
    Event.where(read: false)
  end
end
