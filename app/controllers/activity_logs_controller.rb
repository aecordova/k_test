class ActivityLogsController < ApplicationController
  before_action :get_activity_logs, only: [:index]
  def index
    @activity_logs
  end

  private

  def fetch_activity_logs
    @activity_logs = ActivityLog.all.includes(:baby, :assistant, :activity).newest_first
  end
end
