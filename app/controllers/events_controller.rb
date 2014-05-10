class EventsController < ApplicationController
  before_filter :require_user, only: [:index]

  def index
    ActiveRecord::Base.transaction do
      unread = current_user.events.unread
      current_user.events.unread.update_all(read: true)
      unread.to_json
    end
  end
end
