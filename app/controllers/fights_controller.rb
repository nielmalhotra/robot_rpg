class FightsController < ApplicationController
  before_filter :require_user

  def index
    render json: current_user.fights
  end

  class FightCurrentUserResultDecorator # TODO move, lol
    include ActiveModel::Serializers::JSON
    extend Forwardable

    def initialize(current_user, fight)
      @current_user = current_user
      @fight = fight
      attributes = @fight.try(:attributes).try(:keys)
      FightCurrentUserResultDecorator.class_exec {
        def_delegators :@fight, *attributes
      }
    end

    def current_user_result
      @fight.fight_users.where(user: @current_user).first.result_str
    end

    def my_attributes
      {
          current_user_result: current_user_result
      }
    end

    def attributes
      @fight.attributes.merge(my_attributes)
    end
  end

  def past
    fights = current_user.fights_won + current_user.fights_lost
    render json: fights.map {|fight| FightCurrentUserResultDecorator.new(current_user, fight)}
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

  def in_progress
    render json: current_user.fights.in_progress
  end

  def create
    fight = current_user.create_fight(Mech.find_by_name(params[:my_mech]))
    fight.invite_user(User.find_by_name(params[:opponent]))
    if fight.valid?
      render json: {success: 'Fight Created! Huaaah!'}
    else
      raise ValidationException.new('Fight Not Created. Do it better.')
    end
  end

  def begin
    f = Fight.find(params[:id])
    return if f.creator != current_user # TODO turn into filter
    FightRunner.start(f)
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
end
