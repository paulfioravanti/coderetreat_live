class Coderetreat < ActiveRecord::Base
  def self.running_today
    all
  end

  def update_status(new_status)
    self.update_attributes status: new_status
  end
end
