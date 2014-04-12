class FightMech < ActiveRecord::Base
  self.table_name = 'fight_mechs' # this is necessary because otherwise ActiveRecord pluralizes to 'meches'

  validates_presence_of :fight_user

  belongs_to :fight
  belongs_to :mech
  belongs_to :fight_user

  module Result
    PENDING = nil
  end

  class << self
    def pending
      where(result: Result::PENDING)
    end
  end
end