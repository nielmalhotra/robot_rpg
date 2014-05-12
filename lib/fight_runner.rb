module FightRunner
  def self.start(fight)
    fight.result = Fight::Result::IN_PROGRESS
    fight.current_turn_user_id = fight.creator.id
    fight.save!
  end

  def self.take_turn(fight, user)
    raise "You can't do shit out of turn mothafucka!" if user.id != fight.current_turn_user_id
    targeted_mech = fight.mechs.where('user_id != ?', user.id).sample
    targeted_mech.decrement!(:current_armor, 1 + rand(5))
    next_user = fight.users.where('users.id != ?', user.id).sample
    fight.update_attribute(:current_turn_user_id, next_user.id)
  end

  def self.run_fight(fight)
    with_fight_status_update fight do
      fight.fight_users.accepted.sample.update_attribute(:result, FightUser::Result::WON)
      fight.fight_users.accepted.each do |fight_user|
        fight_user.update_attribute(:result, FightUser::Result::LOST)
      end
    end
  end

  def self.with_fight_status_update(fight, &block)
    begin
      fight.update_attribute(:result, Fight::Result::IN_PROGRESS)
      yield
      fight.update_attribute(:result, Fight::Result::FINISHED)
    rescue
      fight.update_attribute(:result, Fight::Result::ERROR)
    end
  end
end