module FightRunner
  def self.start(fight)
    fight.update_attribute(:result, Fight::Result::IN_PROGRESS)
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