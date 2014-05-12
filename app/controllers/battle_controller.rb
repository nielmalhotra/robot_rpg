class BattleController < ApplicationController
  before_filter :require_user
  before_filter :get_fight

  def status
    render json: {
      #msg: 'something',
      my_mechs: @fight.mechs.where(user_id: current_user.id),
      enemy_mechs: @fight.mechs.where('user_id != ?', current_user.id).sort{|m,n| m.user_id <=> n.user_id},
      current_user_id: current_user.id
    }
  end

  private

  def get_fight
    @fight = Fight.find(params[:id])
  end
end
