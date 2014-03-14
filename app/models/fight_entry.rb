class FightEntry < ActiveRecord::Base
  belongs_to :fight
  belongs_to :mech
end