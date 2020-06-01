class ActivityLog < ApplicationRecord
  validate :stop_after_start

  private

  def stop_after_start
    errors.add(:stop_time, "Stop time can't be before start time") if !stop_time.nil? && start_time >= stop_time
  end
end
