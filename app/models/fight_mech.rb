class FightMech < ActiveRecord::Base
  self.table_name = 'fight_mechs' # this is necessary because otherwise ActiveRecord pluralizes to 'meches'

  belongs_to :fight
  belongs_to :mech
end