class FightUser < ActiveRecord::Base
  belongs_to :fight
  belongs_to :user

  has_many :fight_mechs

  module Result
    INVITED = nil
    ACCEPTED = 0
    DENIED = 1
    WON = 2
    WIN = WON
    LOST = 3
    LOSS = LOST
  end

  class << self
    def invited
      where(result: Result::INVITED)
    end

    def accepted
      where(result: Result::ACCEPTED)
    end

    def denied
      where(result: Result::DENIED)
    end

    def won
      where(result: Result::WON)
    end

    def lost
      where(result: Result::LOST)
    end

    def creator
      where(creator: true)
    end
  end
end