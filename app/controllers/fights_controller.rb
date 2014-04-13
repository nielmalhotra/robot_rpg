class FightsController < ApplicationController
  before_filter :require_user

  def index
    render json: current_user.fights
  end

  def create
    fight = current_user.create_fight(Mech.find_by_name(params[:my_mech]))
    fight.invite_user(User.find_by_name(params[:opponent]))
    render json: {success: 'Fight Created! Huaaah!'}
  end
end
