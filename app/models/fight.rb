class Fight < ActiveRecord::Base
  has_many :fight_mechs
  has_many :mechs, through: :fight_mechs

  has_many :fight_users
  has_many :users, through: :fight_users

  has_many :logs, -> { order 'sequence ASC' }, class_name: 'FightLog'

  validates_presence_of :start_time

  def creator
    fight_users.where(creator: true).first.try(:user)
  end

  def mechs_entered_by_user(user)
    fight_users.where(user: user).collect(&:fight_mechs).flatten.collect(&:mech)
  end

  def users_invited
    fight_users.invited.collect(&:user)
  end

  def users_accepted
    fight_users.accepted.collect(&:user)
  end

  def users_denied
    fight_users.denied.collect(&:user)
  end

  def users_won
    fight_users.won.collect(&:user)
  end

  def users_lost
    fight_users.lost.collect(&:user)
  end

  def invite_user(user)
    # TODO validate not already invited
    add_user(user, FightUser::Result::INVITED)
  end

  def add_user(user, result, creator = false)
    # TODO validate no other creator if creator
    FightUser.create do |fight_user|
      fight_user.user = user
      fight_user.fight = self
      fight_user.result = result
      fight_user.creator = creator
    end
  end

  def add_creator(user, result = FightUser::Result::ACCEPTED)
    add_user(user, result, true)
  end

  def add_mech(mech, fight_user, result)
    FightMech.create do |fight_mech|
      fight_mech.mech = mech
      fight_mech.fight_user = fight_user
      fight_mech.fight = self
      fight_mech.result = result
    end
  end

  def run
    FightRunner.run_fight(self)
  end

  module Result
    ERROR = -1
    PENDING = nil
    IN_PROGRESS = 0
    FINISHED = 1
  end

  class << self
    def pending
      where(result: Result::PENDING)
    end

    def in_progress
      where(result: Result::IN_PROGRESS)
    end

    def finished
      where(result: Result::FINISHED)
    end
  end
end