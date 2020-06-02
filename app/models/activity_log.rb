class ActivityLog < ApplicationRecord
  validate :stop_after_start
  after_update :set_duration
  
  belongs_to :activity
  belongs_to :baby
  belongs_to :assistant

  private

  def stop_after_start
    errors.add(:stop_time, "Stop time can't be before start time") if !stop_time.nil? && start_time >= stop_time
  end
end
