class User < ActiveRecord::Base
  has_many :mechs

  has_many :fight_users
  has_many :fights, through: :fight_users

  has_many :messages_sent, class_name: 'Message', foreign_key: :from_id
  has_many :messages_received, class_name: 'Message', foreign_key: :to_id

  attr_accessible :name, :email, :password, :password_confirmation

  def fights_invited
    fight_users.invited.collect(&:fight)
  end

  def fights_accepted
    fight_users.accepted.collect(&:fight)
  end

  def fights_denied
    fight_users.denied.collect(&:fight)
  end

  def fights_won
    fight_users.won.collect(&:fight)
  end

  def fights_lost
    fight_users.lost.collect(&:fight)
  end

  def create_fight(mech)
    fight = Fight.create do |fight|
      fight.start_time = Time.now # change eventually
      fight.result = Fight::Result::PENDING
    end
    fight_user = fight.add_creator(self)
    fight.add_mech(mech, fight_user, FightMech::Result::PENDING)
    fight
  end

  def accept_fight(invited_fight, mech)
    fight_user = invited_fight.fight_users.where(user: self).invited.first
    if fight_user.present?
      fight_user.update_attribute(:result, FightUser::Result::ACCEPTED)
      invited_fight.add_mech(mech, fight_user, FightMech::Result::PENDING)
    else
      raise "accept_fight couldnt find invited fight_user for fight.id=#{invited_fight.id} and user.id=#{self.id}"
    end
  end

  def deny_fight(invited_fight)
    fight_user = invited_fight.fight_users.where(user: self).invited.first
    if fight_user.present?
      fight_user.update_attribute(:result, FightUser::Result::DENIED)
    else
      raise "deny_fight couldnt find invited fight_user for fight.id=#{invited_fight.id} and user.id=#{self.id}"
    end
  end

  def read_all_messages!
    messages_received.each do |message|
      message.read!
    end
  end

  acts_as_authentic do |c|
    c.login_field = :name
    c.validate_email_field = false
  end
end
