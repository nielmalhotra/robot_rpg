class Mech < ActiveRecord::Base
  self.table_name = 'mechs'
  belongs_to :user
end
