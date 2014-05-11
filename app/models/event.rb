class Event < ActiveRecord::Base
  belongs_to :user
  self.inheritance_column = nil

  def attributes
    {
        id: id,
        user_id: user_id,
        type: type,
        data: data,
        created_at: created_at
    }
  end

  module Type
    # other code is meant to define its own event types by reopening this module
  end

  class << self
    def read
      Event.where(read: true)
    end

    def unread
      Event.where(read: false)
    end

    def publish(user, type, data = nil)
      # TODO validate type?
      self.create do |event|
        event.user_id = user.id
        event.type = type
        event.data = data.to_json
      end
    end

    def get(user, type = nil)
      ActiveRecord::Base.transaction do
        events = user.events.unread
        events = events.where(type: type) if !type.nil?
        ids = events.map(&:id)
        events.update_all(read: true) # mark all read
        return self.find(ids)
      end
    end
  end

end
