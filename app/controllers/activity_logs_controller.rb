class ActivityLogsController < ApplicationController
  before_action :fetch_activity_logs, only: [:index]
  before_action :login_first

  def index
    @activity_logs
  end

  private

  def fetch_activity_logs
    @activity_logs = ActivityLog.all.includes(:baby, :assistant, :activity).newest_first
  end
end
