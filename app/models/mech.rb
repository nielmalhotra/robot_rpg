class Mech < ActiveRecord::Base
  self.table_name = 'mechs' # this is necessary because otherwise ActiveRecord pluralizes to 'meches'

  belongs_to :user

  has_many :fight_mechs
  has_many :fights, through: :fight_mechs

  validates_presence_of :name

  def attributes
    {
        id: id,
        name: name,
        user_id: user_id,
        current_armor: current_armor
    }
  end
end
