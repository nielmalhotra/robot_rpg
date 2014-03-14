class Mech < ActiveRecord::Base
  self.table_name = 'mechs' # this is necessary because otherwise ActiveRecord pluralizes to 'meches'

  belongs_to :user

  has_many :fight_entries
  has_many :fights, through: :fight_entries
end
