class FightsController < ApplicationController
  before_filter :require_user

  def index
    render json: current_user.fights
  end

  def create
  end
end
