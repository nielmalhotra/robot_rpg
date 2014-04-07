class Mech < ActiveRecord::Base
  self.table_name = 'mechs' # this is necessary because otherwise ActiveRecord pluralizes to 'meches'

  belongs_to :user

  has_many :fight_mechs
  has_many :fights, through: :fight_mechs
end
