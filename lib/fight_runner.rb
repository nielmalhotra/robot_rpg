module FightRunner

  def self.run_fight(fight)
    fight.fight_users.accepted.sample.update_attribute(:result, FightUser::Result::WON)
    fight.fight_users.accepted.each do |fight_user|
      fight_user.update_attribute(:result, FightUser::Result::LOST)
    end
  end

end