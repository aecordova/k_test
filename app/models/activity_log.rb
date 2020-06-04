class ActivityLog < ApplicationRecord
  validate :stop_after_start
  before_update :set_duration

  belongs_to :activity
  belongs_to :baby
  belongs_to :assistant

  scope :newest_first, -> { order('start_time DESC') }
  scope :baby_filtered, ->(baby = nil) { where('baby_id = ?', baby.id) unless baby.nil? }

  def status
    stop_time.nil? ? 1 : 0
  end

  def duration_in_min
    duration / 60 unless stop_time.nil?
  end

  private

  def stop_after_start
    errors.add(:stop_time, "Stop time can't be before start time") unless stop_time.nil? || start_time < stop_time
  end

  def set_duration
    self.duration = (stop_time - start_time).to_i unless stop_time.nil?
  end
end
