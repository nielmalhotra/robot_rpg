class FightLog < ActiveRecord::Base
  belongs_to :fight

  validates_presence_of :fight, :sequence, :message
end