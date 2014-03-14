class Fight < ActiveRecord::Base
  has_many :fight_entries
  has_many :mechs, through: :fight_entries

  has_many :fight_logs, -> { order 'sequence ASC' }

  validates_presence_of :start_time
end