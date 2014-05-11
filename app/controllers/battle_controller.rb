class BattleController < ApplicationController
  before_filter :require_user
  before_filter :get_fight

  def test
    render json: {
        msg: ['pow', 'bang', 'boom', 'boff', 'bazz', 'zap', 'bang', 'kerchunk', 'skwatch'].sample,
        fight: @fight
    }
  end

  private

  def get_fight
    @fight = Fight.find(params[:id])
  end
end
