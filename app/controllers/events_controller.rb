class EventsController < ApplicationController
  before_filter :require_user, only: [:index]

  def index
    render json: Event.get(current_user)
  end
end
