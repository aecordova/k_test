class ActivityLog < ApplicationRecord
  validate :stop_after_start
  after_update :set_duration

  private

  def stop_after_start
    errors.add(:stop_time, "Stop time can't be before start time") if !stop_time.nil? && start_time >= stop_time
  end
  
  def set_duration 
    self.duration = (stop_time - start_time).to_i
  end
end
