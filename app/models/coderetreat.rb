class Coderetreat < ActiveRecord::Base
  def self.running_today
    all
  end

  def update_status(new_status)
    self.update_attributes status: new_status
  end

  def available_next_statuses
    ["not_started", "on_break", "in_session"] - [self.status]
  end
end
