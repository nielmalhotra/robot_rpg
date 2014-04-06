class Fight < ActiveRecord::Base
  has_many :fight_entries
  has_many :mechs, through: :fight_entries

  has_many :logs, -> { order 'sequence ASC' }, class_name: 'FightLog'

  validates_presence_of :start_time
end