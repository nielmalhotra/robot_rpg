class FightsController < ApplicationController
  before_filter :require_user

  def index
    render json: current_user.fights
  end

  def invited
    render json: current_user.fights_invited
  end

  def create
    begin
      fight = current_user.create_fight(Mech.find_by_name(params[:my_mech]))
      fight.invite_user(User.find_by_name(params[:opponent]))
      if fight.valid?
        render json: {success: 'Fight Created! Huaaah!'}
      else
        render json: {fail: 'Fight Not Created. Do it better.'}, status: 400
      end
    rescue
      render json: {fail: 'Fight Not Created. Do it better.'}, status: 400
    end
  end
end
