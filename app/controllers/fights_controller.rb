class FightsController < ApplicationController
  before_filter :require_user

  def index
    render json: current_user.fights
  end

  def invited
    render json: current_user.fights_invited
  end

  def owned
    render json: current_user.fights_created.select(&:pending?)
  end

  def upcoming
    render json: current_user.fights_accepted.select(&:pending?)
  end

  def begin
    f = Fight.find(params[:id])
    return if f.creator != current_user # TODO turn into filter
    f.run
    render json: {success: 'Fight Has Begun!'}
  end

  def invite
    f = Fight.find(params[:id])
    return if f.creator != current_user # TODO turn into filter
    f.invite_user(User.find_by_name(params[:opponent]))
    render json: {success: 'User Invited'}
  end

  def accept
    current_user.accept_fight(Fight.find(params[:id]), Mech.find_by_name(params[:my_mech]))
    render json: {success: 'Fight Accepted'}
  end

  def deny
    current_user.deny_fight(Fight.find(params[:id]))
    render json: {success: 'Fight Denied'}
  end

  def create
    fight = current_user.create_fight(Mech.find_by_name(params[:my_mech]))
    fight.invite_user(User.find_by_name(params[:opponent]))
    if fight.valid?
      render json: {success: 'Fight Created! Huaaah!'}
    else
      render json: {fail: 'Fight Not Created. Do it better.'}, status: 400
    end
  end
end
