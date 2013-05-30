class Coderetreat < ActiveRecord::Base
  def self.running_today
    all
  end
end
